---
name: relembrar
description: Recupera memória técnica de sessões anteriores para reconstruir contexto, decisões, código alterado, problemas e pendências antes de continuar.
---

# Skill Relembrar

## Objetivo

Recuperar contexto confiável da base persistente do projeto sem inventar fatos nem tratar notas antigas como estado atual do código.

## Localização

Consultar `C:\Users\gabriel.guedes\Documents\mcorp-app\.cursor\memoria`.

## Acionamento

Quando o usuário usar `/relembrar`, pedir para recuperar contexto anterior ou retomar tarefa interrompida.

## Procedimento

1. Identifique assunto, módulo, período e objetivo do pedido.
2. Leia `INDEX.md` e pesquise títulos, palavras-chave, arquivos, funções e decisões nas pastas `topicos/`, `decisoes/` e `sessoes/`.
3. Recupere primeiro as notas temáticas e decisões vigentes; depois leia sessões relevantes para cronologia e evidências.
4. Compare versões e marque decisões substituídas e contradições.
5. Quando for continuar implementando, confira o estado atual dos arquivos do repositório antes de agir.
6. Se a base não tiver evidência suficiente, diga o que não foi encontrado. Não simule memória.
7. Reconstrua um resumo operacional com objetivo, arquitetura, decisões vigentes, trabalho realizado, problemas, pendências e próximo passo.
8. Cite caminhos relativos das notas e arquivos de código consultados.
9. Se houver novos achados relevantes, sugira registrar via skill `memoria`.

## Resposta padrão

- **Contexto recuperado:** assunto e objetivo.
- **O que sabemos:** fatos confirmados com referências.
- **Decisões vigentes:** e razões.
- **O que foi feito:** somente mudanças comprovadas.
- **Estado atual:** validado no código, se consultado.
- **Pendências e próximo passo:** ação concreta.
- **Lacunas:** informação ausente ou incerta.

## Regras

- Não confundir intenção com implementação.
- Não usar uma nota desatualizada como verdade atual sem verificar.
- Não expor segredos ou dados pessoais.
- Priorizar precisão e relevância sobre quantidade de texto.
