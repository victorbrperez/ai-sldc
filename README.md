# AI SLDC (Agent Agnostic)

Flujo simplificado basado en specs de un solo archivo.

## Instalación en un proyecto
Desde la raíz de tu proyecto:
```bash
curl -fsSL https://raw.githubusercontent.com/victorbrperez/ai-sldc/main/install.sh | bash
```
Actualizar el workflow (solo `.agents/`, nunca `docs/`):
```bash
curl -fsSL https://raw.githubusercontent.com/victorbrperez/ai-sldc/main/install.sh | bash -s -- --update
```
Invocación local (clon del repo):
```bash
./install.sh --target /ruta/a/tu-proyecto
./install.sh --update --target /ruta/a/tu-proyecto
AI_SLDC_REPO=/ruta/a/ai-sldc ./install.sh --target /ruta/a/tu-proyecto  # probar cambios locales
```
Opciones: `--ref <tag|branch>` para fijar versión, `--target <dir>` para otro destino.
La instalación no sobrescribe archivos existentes.

## Entradas principales
- `/init-project`: completar los docs de contexto (una sola vez)
- `/feature`: crear nueva funcionalidad
- `/change`: modificar funcionalidad existente
- `/bugfix`: diagnosticar y corregir defectos (vía spec)

## Ejecución
- `/implement <spec-id|path>`: solo para specs `approved`

## Estados de spec
`draft -> ready_for_review -> approved -> implemented -> archived`

Regla estricta: si la spec no está en `approved`, `/implement` no se ejecuta.

## Estructura
- `.agents/commands/`: prompts operativos, autocontenidos
- `.agents/templates/spec-template.md`: plantilla única
- `docs/project.md`, `docs/architecture.md`, `docs/tech-stack.md`, `docs/conventions.md`: contexto del proyecto (se completan con `/init-project`)
- `docs/specs/active`: specs en curso
- `docs/specs/archive`: historial cerrado

## Flujo recomendado
0. Ejecutar `/init-project` (una sola vez; `/feature`, `/change` y `/bugfix` se detienen si falta contexto)
1. Ejecutar `/feature` o `/change` o `/bugfix`
2. Revisar y completar spec (`draft`/`ready_for_review`)
3. Aprobar con `/spec-approve`
4. Ejecutar `/implement` (incluye crear rama, implementar, validar, registrar PR y archivar al confirmarse el merge)

## Adaptación a otros agentes
`.agents/commands/` es la fuente única. Para generar los comandos nativos de Claude Code, opencode y Goose:
```bash
.agents/scripts/sync-commands.sh
```
Esto crea (sobrescribiendo en cada ejecución, son archivos derivados):

| Agente | Destino | Formato |
|---|---|---|
| Claude Code | `.claude/commands/<nombre>.md` | copia literal del `.md` |
| opencode | `.opencode/commands/<nombre>.md` | copia literal del `.md` (mismo formato que Claude Code: markdown plano, sin frontmatter) |
| Goose | `.goose/recipes/<nombre>.yaml` | recipe YAML generada (`title`/`description`/`instructions`); regístrala como slash command en tu `config.yaml` si quieres invocarla por nombre |

Otros agentes (fuera del alcance de este script):
| Agente | Commands |
|---|---|
| Codex | Solo a nivel usuario: `~/.codex/prompts/` |
| pi | Copiar a `.pi/prompts/` |

Notas:
- No uses symlinks: fallan en Windows y en algunos zips o CI.
- Añade las rutas generadas (`.claude/`, `.opencode/`, `.goose/`, `.pi/`, etc.) al `.gitignore` para no duplicar fuentes.
- GitHub Copilot (CLI) no tiene mecanismo de comandos/prompts custom a día de hoy (la extensión `gh-copilot` fue deprecada en oct-2025; el nuevo `copilot` CLI standalone no soporta prompt files) — queda fuera de la compatibilidad de este proyecto.
- Verifica las rutas en la documentación oficial de cada agente, pueden cambiar.
