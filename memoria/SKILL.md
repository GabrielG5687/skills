---
name: memoria
description: Registra e consolida conhecimento persistente do projeto, decisões, alterações, bugs e pendências entre sessões do Cursor.
---

# Skill Memória

## Objetivo

Manter memória técnica persistente, verificável e concisa do trabalho dos agentes no projeto. Não registrar segredos, tokens, credenciais ou dados pessoais desnecessários.

## Localização

Raiz da memória: `C:\Users\gabriel.guedes\Documents\mcorp-app\.cursor\memoria`.
Use caminhos relativos a esta pasta. Não sobrescreva registros históricos silenciosamente.

## Quando executar

- Ao concluir uma tarefa significativa, correção ou investigação.
- Quando o usuário disser `/memoria`, "guarde isso" ou "registre o contexto".
- Antes de encerrar uma sessão longa ou após decisões arquiteturais importantes.
- Se houver automação/hook configurado, executar no evento correspondente; a skill sozinha não roda continuamente em segundo plano.

## Procedimento

1. Identifique o projeto, módulo, objetivo e arquivos envolvidos.
2. Separe fatos observados de hipóteses, propostas, decisões e mudanças confirmadas.
3. Registre somente conhecimento reutilizável; não copie conversas completas indiscriminadamente.
4. Consulte `INDEX.md` e registros correlatos antes de criar duplicatas.
5. Crie nota de sessão em `sessoes/YYYY-MM-DD-assunto.md` e atualize a nota temática em `topicos/` quando pertinente.
6. Registre decisões em `decisoes/` com data, justificativa, consequências e estado (vigente, substituída, pendente).
7. Atualize `INDEX.md` com links relativos, palavras-chave e resumo de uma linha.
8. Se uma informação contradisser outra, preserve histórico e marque a anterior como substituída; não apague evidências.
9. Valide caminhos e nomes de arquivos antes de afirmar que uma mudança foi implementada.

## Formato obrigatório das notas

```markdown
---
data: YYYY-MM-DD
projeto: mcorp-app
modulo: nome-do-modulo
status: confirmado | proposto | pendente | substituido
palavras_chave: [termo1, termo2]
fontes: [caminho/do/arquivo:linha, conversa-ou-commit-se-disponivel]
---
# Assunto
## Contexto e objetivo
## Evidências e fatos confirmados
## Decisões e justificativas
## Alterações realizadas (arquivos e funções)
## Testes e validação
## Pendências e próximos passos
## Relações com outras memórias
```

## Regras de qualidade

- Nunca apresentar hipótese como implementação concluída.
- Registrar precedência, invariantes, restrições e riscos relevantes.
- Não salvar segredos, chaves de API, tokens, senhas, CPFs ou dados sensíveis.
- Não salvar grandes trechos de código: apontar para arquivos, funções e commits.
- Preferir atualização incremental a reescrita total.
- Resumir sem perder decisões e motivos.
- Ao final, informar brevemente o que foi registrado e onde.
