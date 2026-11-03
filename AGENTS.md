# Instruções para agentes de IA

Este repositório contém skills no formato `<nome>/SKILL.md`.

## Instalar

Escolha o destino e copie cada pasta com `SKILL.md`:

- Instalação automática (detecta Cursor e OpenCode do usuário):

  ```powershell
  powershell -ExecutionPolicy Bypass -File install.ps1
  ```

  ```bash
  bash install.sh
  ```

- Destino explícito:

  ```powershell
  powershell -ExecutionPolicy Bypass -File install.ps1 -Destination .cursor/skills
  ```

  ```bash
  DESTINATION=.cursor/skills bash install.sh
  ```

- Manual: copie `<nome>/` para `<destino>/<nome>/`, garantindo que exista `<destino>/<nome>/SKILL.md`.

Destinos comuns:

| Cliente | Escopo | Caminho |
| --- | --- | --- |
| Cursor | usuário | `~/.cursor/skills` (Windows: `%USERPROFILE%\.cursor\skills`) |
| Cursor | projeto | `.cursor/skills` |
| OpenCode | usuário | `~/.config/opencode/skills` |
| OpenCode | projeto | `.opencode/skills` |

## Regras

- Sobrescreva apenas com `-Force` (PowerShell) ou `FORCE=1` (bash).
- Não copie `debug.log` nem `*.log`.
- Preserve os nomes das pastas: o nome do diretório é o identificador da skill.
- Após instalar, leia o `SKILL.md` da skill antes de usá-la.
