# skills

Coleção de skills de agente (Cursor / OpenCode) em formato `SKILL.md`.

## Skills

| Skill | Descrição |
| --- | --- |
| `design-system-builder` | Construção de design system |
| `engine-uiux` | Engine de UI/UX |
| `landing-page-scaffold` | Scaffold de landing pages |
| `melhoria-ux-desingner` | Melhorias de UX/design |
| `memoria` | Memória de sessões e decisões |
| `recovery` | Recuperação de contexto |
| `relembrar` | Consulta ao histórico/memória |
| `reverse-engine` | Engenharia reversa de sites e aplicações web |
| `ui-bug-hunter` | Caça a bugs de UI |
| `ui-color-guard` | Guarda de consistência de cores |
| `ui-reference` | Reprodução fiel de interfaces a partir de imagem |
| `ui-refinement` | Refinamento de interfaces |

## Instalação

Instala todas as skills detectando Cursor e OpenCode do usuário:

```powershell
git clone --depth 1 https://github.com/GabrielG5687/skills "$env:TEMP\skills"
powershell -ExecutionPolicy Bypass -File "$env:TEMP\skills\install.ps1"
```

```bash
git clone --depth 1 https://github.com/GabrielG5687/skills /tmp/skills
bash /tmp/skills/install.sh
```

Destino explícito (ex.: skills do projeto atual):

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1 -Destination .cursor/skills
```

```bash
DESTINATION=.opencode/skills bash install.sh
```

`-Client opencode|cursor|both` (padrão `both`) e `-Force`/`FORCE=1` para sobrescrever.

## Instalar com a IA

Cole no agente:

```text
Clone https://github.com/GabrielG5687/skills e instale as skills rodando
install.ps1 -Destination <pasta de skills do projeto> (ou install.sh no Linux/macOS).
```

Instruções detalhadas para agentes estão em `AGENTS.md`.

## Uso

Copie a pasta da skill para o diretório de skills do seu cliente:

- Cursor: `.cursor/skills/<nome>/SKILL.md`
- OpenCode: `.opencode/skills/<nome>/SKILL.md`
