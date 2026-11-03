---
name: recovery
description: Recupera a última alteração realizada pela IA no projeto, revertendo arquivos ao estado anterior sem afetar alterações manuais do desenvolvedor.
---

# Skill Recovery

## Objetivo

Permitir recuperar a última alteração realizada pela IA no projeto, restaurando os arquivos ao estado anterior à última intervenção.

## Gatilhos

Ativar quando o usuário solicitar:
- `/recovery`
- "Voltar última alteração"
- "Desfazer última alteração da IA"
- "Recuperar versão anterior"
- "Desfazer o que você acabou de fazer"

## Procedimento

1. Identificar a última alteração realizada pela IA.
2. Consultar o histórico de alterações e os registros da skill `memoria`.
3. Identificar todos os arquivos modificados na última intervenção.
4. Comparar o estado atual com o estado anterior.
5. Apresentar um resumo dos arquivos que serão restaurados.
6. Restaurar somente as alterações identificadas.

## Regras de segurança

- Nunca executar `git reset --hard`.
- Nunca executar `git checkout -- .`.
- Nunca apagar alterações manuais do desenvolvedor.
- Nunca reverter arquivos que não estejam relacionados à última alteração da IA.
- Preservar alterações posteriores realizadas pelo usuário.
- Se não for possível identificar com segurança a última alteração, não executar nenhuma reversão.
- Criar uma cópia temporária dos arquivos atuais antes da recuperação.

## Estratégia de recuperação

Prioridade das fontes:

1. Snapshot anterior à alteração.
2. Histórico de alterações registrado pela skill `memoria`.
3. Histórico local do editor.
4. Git diff, quando houver commits ou alterações rastreáveis.

## Resultado esperado

Após a recuperação, apresentar:

- Arquivos restaurados.
- Alterações desfeitas.
- Arquivos preservados.
- Possíveis limitações da recuperação.

## Regra principal

A recuperação deve desfazer exclusivamente a última intervenção da IA, nunca o trabalho manual do desenvolvedor.
