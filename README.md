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
- `.agents/commands/`: prompts operativos
- `.agents/skills/<nombre>/SKILL.md`: capacidades reutilizables
- `.agents/templates/spec-template.md`: plantilla única
- `docs/project.md`, `docs/architecture.md`, `docs/tech-stack.md`, `docs/conventions.md`: contexto del proyecto (se completan con `/init-project`)
- `docs/specs/active`: specs en curso
- `docs/specs/archive`: historial cerrado

## Flujo recomendado
0. Ejecutar `/init-project` (una sola vez; `/feature`, `/change` y `/bugfix` se detienen si falta contexto)
1. Ejecutar `/feature` o `/change` o `/bugfix`
2. Revisar y completar spec (`draft`/`ready_for_review`)
3. Aprobar con `/spec-approve`
4. Ejecutar `/implement`
5. Archivar spec al cierre

## Adaptación a otros agentes
`.agents/` es la fuente única. Si un agente no lee esa ruta, **copia** (no enlaces) los archivos a su ubicación.

| Agente | Skills | Commands |
|---|---|---|
| Codex | `.agents/skills/` (nativo) | Solo a nivel usuario: `~/.codex/prompts/` |
| pi | `.agents/skills/` o `.pi/skills/` | Copiar a `.pi/prompts/` |
| Goose | `.agents/skills/` o `.goose/skills/` | Convertir a recipes (YAML) |
| Claude Code | Copiar a `.claude/skills/` | Copiar a `.claude/commands/` |
| GitHub Copilot | Copiar a `.github/skills/` | Copiar a `.github/prompts/` como `<nombre>.prompt.md` |

Notas:
- No uses symlinks: fallan en Windows y en algunos zips o CI.
- Añade las rutas copiadas (`.claude/`, `.pi/`, etc.) al `.gitignore` para no duplicar fuentes.
- Verifica las rutas en la documentación oficial de cada agente, pueden cambiar.
