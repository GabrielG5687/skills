---
name: create-job
description: Cria e revisa jobs do mCorp Status seguindo o contrato do registry, dos handlers e do scheduler. Use quando o usuário pedir para adicionar um job, criar um cron, registrar um jobId, corrigir um sync agendado, ou mencionar mcorp-status, registry.js, internalJobHandlers ou sync:mcorp-runtime.
---

# Jobs no mCorp Status — guia escalável

Documento canônico para humanos e IAs (Cursor, Gravity, etc.).  
Objetivo: qualquer pessoa adicionar um job **respeitando o contrato** abaixo, sem reinventar o runner.

**Relacionado:** [MIGRATION-JOBS.md](./MIGRATION-JOBS.md) (histórico da migração MCORP → Status).

---

## 1. Ideia em uma frase

O **mCorp Status** é o **único runner de crons**.  
A **lógica de negócio** continua (em geral) no código do MCORP, vendido para o Status via `mcorp-runtime`.  
O Status **agenda, executa, grava histórico e mostra logs** na UI.

```
Cron / “Rodar agora”
    → registry + MySQL (job_definitions)
    → runner.executeJob(jobId)
    → handler (mcorp-local | nativo | proxy)
    → job_runs + job_run_logs + Socket.IO
```

**Regra de ouro:** o mesmo `jobId` **nunca** agenda no MCORP e no Status ao mesmo tempo.

---

## 2. Mapa de pastas

```
mcorp-status/backend/
├── src/jobs/
│   ├── registry.js          # inventário canônico (fonte da verdade dos jobs)
│   ├── runner.js            # executeJob, histórico, Socket.IO
│   ├── scheduler.js         # seed MySQL + node-cron
│   └── handlers/
│       ├── index.js         # handler_key → função run
│       ├── mcorpLocal.js    # Modelo B: roda runJobById no mcorp-runtime
│       ├── mcorpProxy.js    # Modelo A (legado): HTTP → MCORP
│       ├── heartbeat.js
│       └── jobLogsCleanup.js
├── src/mcorp-runtime/       # cópia do domínio MCORP (versionada — regenerar com sync)
│   └── jobs/internalJobHandlers.js
└── scripts/sync-mcorp-runtime.js

mcorp-app/backend/
├── src/jobs/internalJobHandlers.js   # mapa jobId → service (origem)
├── src/jobs/scheduler.js             # NÃO agendar IDs migrados
└── src/services/...                  # lógica de negócio
```

Antes de publicar mudança de jobs: `npm run sync:mcorp-runtime` no Status e **commitar** `src/mcorp-runtime/` (produção usa o que está no Git).

---

## 3. Contrato de um job (linguagem obrigatória)

Todo job no Status tem estes campos em `registry.js`:

| Campo | Obrigatório | Significado |
|-------|-------------|-------------|
| `id` | sim | ID estável (slug). **Mesmo valor** em `internalJobHandlers` do MCORP |
| `name` | sim | Nome na UI |
| `description` | recomendado | O que faz |
| `module` | sim | Grupo na UI (`adp`, `skymail`, `notificacoes`, `sistema`, …) |
| `cron_expr` | sim | Cron `node-cron` |
| `timezone` | sim | Padrão: `America/Cuiaba` |
| `handler_key` | sim | Ver §4 |
| `enabled` | sim | `true` só depois de desligar o cron no MCORP |
| `env_keys` | sim (pode `[]`) | Envs que a UI checa antes de confiar no job |

Exemplo mínimo (domínio MCORP):

```js
{
  id: 'meu-modulo-sync-diario',
  name: 'Meu módulo — sync diário',
  description: 'Sincroniza X com Y uma vez por dia.',
  module: 'meu-modulo',
  cron_expr: '0 3 * * *',
  timezone: 'America/Cuiaba',
  handler_key: 'mcorp-local',
  enabled: true,
  env_keys: ['MYSQL_HOST', 'REDIS_HOST'],
}
```

### Regras do `id`

- kebab-case: `area-acao-frequencia` (ex.: `skymail-grupos-sync`)
- Imutável depois de publicado (é PK e chave do mapa de handlers)
- Um `id` = uma responsabilidade

---

## 4. Handlers (`handler_key`)

| handler_key | Quando usar |
|-------------|-------------|
| `mcorp-local` | **Padrão.** Lógica no MCORP, executada no processo Status via `mcorp-runtime` |
| `heartbeat` / `job-logs-cleanup` | Jobs nativos do próprio Status |
| `mcorp-proxy` | Legado: Status chama HTTP interno no MCORP (evitar em jobs novos) |

Escolha **não** vem de `JOB_RUNTIME` no código — vem do `handler_key` no registry.

---

## 5. Como adicionar um job novo (checklist)

### A) Job de domínio MCORP (caminho padrão)

1. **Service** em `mcorp-app/backend/src/services/...` (lógica pura, testável).
2. **Registrar** em `mcorp-app/backend/src/jobs/internalJobHandlers.js`:
   ```js
   'meu-modulo-sync-diario': async () => {
     const Svc = require('../services/meuModuloSync.service');
     return Svc.run(); // ou o método público
   },
   ```
3. **Desligar cron no MCORP** para esse ID:
   - incluir em `JOBS_DISABLED=meu-modulo-sync-diario` **ou**
   - `JOBS_ENABLED=false` se o cutover for total.
4. **Entrada** em `mcorp-status/backend/src/jobs/registry.js` (mesmo `id`, `handler_key: 'mcorp-local'`).
5. **Sync runtime:** no Status → `npm run sync:mcorp-runtime`.
6. **Envs** do domínio no `.env` do Status (espelhar o que o service precisa).
7. **Restart** do backend Status → seed + cron.
8. **Testar:** UI Jobs → “Rodar agora”, ou `POST /api/jobs/meu-modulo-sync-diario/run`.

Não crie handler novo no Status se for domínio MCORP: `mcorp-local` já despacha por `jobId`.

### B) Job nativo do Status

1. `src/jobs/handlers/meuHandler.js` exportando `async function run({ jobId, def, log, triggeredBy })`.
2. Registrar em `handlers/index.js`.
3. Entrada no `registry.js` com o novo `handler_key`.

---

## 6. Flags de ambiente

| Variável | Onde | Efeito |
|----------|------|--------|
| `JOBS_ENABLED=false` | Status | Não agenda crons; “Rodar agora” ainda funciona |
| `JOBS_ENABLED=false` | MCORP | Não agenda crons locais (runner = Status) |
| `JOBS_DISABLED=id1,id2` | só MCORP | Desliga IDs específicos no MCORP |
| `JOBS_STRICT_ENV=true` | Status | Impede enable na UI se faltar env do `env_keys` |
| `JOB_RUN_RETENTION_DAYS` | Status | Retenção de histórico (job de limpeza) |
| `TZ` | Status | Timezone do processo |

**Máquina local de dev:** use `JOBS_ENABLED=false` no Status se os syncs devem rodar só no servidor de jobs.

---

## 7. Banco e API

**Tabelas (MySQL do Status):** `job_definitions`, `job_runs`, `job_run_logs`.

**API:**

| Método | Rota |
|--------|------|
| GET | `/api/jobs` |
| PATCH | `/api/jobs/:id` (enabled, cron) |
| POST | `/api/jobs/:id/run` |
| GET | `/api/jobs/runs/:runId/logs` |
| GET | `/api/jobs/env-checklist` |

**Socket.IO:** `job:run:start`, `job:log`, `job:run:done` (UI JobDetail).

---

## 8. Anti-padrões (não fazer)

- Agendar o mesmo `id` no MCORP **e** no Status
- Criar job sem registrar em `internalJobHandlers` (quando for `mcorp-local`)
- Esquecer `sync:mcorp-runtime` depois de mudar handlers no MCORP
- Usar `mcorp-proxy` em jobs novos sem necessidade
- IDs genéricos (`sync`, `job1`) ou com espaços
- Depender de paths de arquivo da máquina local (ex.: fotos em pasta do laptop)

---

## 9. Modelo mental para IAs

Ao implementar ou revisar um job:

1. O `id` está no **registry do Status** e no **internalJobHandlers do MCORP**?
2. O cron no MCORP está **desligado** para esse id?
3. `handler_key` é `mcorp-local` (padrão)?
4. `env_keys` lista o mínimo que o service precisa?
5. Depois de editar MCORP handlers: rodou `sync:mcorp-runtime`?
6. Há lock de “já em execução” — jobs longos não devem ser cron a cada minuto sem necessidade.

---

## 10. Copiar este arquivo

Caminhos:

| Onde | Path |
|------|------|
| Fonte canônica | `docs/JOBS.md` |
| Cópia para a UI (Vite) | `frontend/public/docs/JOBS.md` |
| Skill Cursor | `.cursor/skills/mcorp-status-jobs/SKILL.md` |
| Tela | **Jobs → Documentação** (`/jobs/docs`) — **Copiar para IA** |

Ao editar a fonte, copie também para `frontend/public/docs/JOBS.md` (a tela lê o estático primeiro).

Use este doc + o skill como contexto ao pedir “adicione um job” ou “corrija sync X”.
