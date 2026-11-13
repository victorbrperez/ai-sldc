---
name: spec-review
description: Evalúa si una spec es aprobable según un checklist. Úsala antes de aprobar una spec.
---

# Skill: spec-review

Contexto: leer `docs/project.md`, `docs/architecture.md`, `docs/tech-stack.md` y `docs/conventions.md` cuando aplique; ignorar los que estén sin completar.

Objetivo:
Evaluar si la spec es aprobable.

Checklist:
- objetivo claro y medible
- alcance definido
- criterios de aceptación verificables
- plan de validación
- riesgos + mitigaciones
- rollback
- tecnologías y librerías definidas en `docs/tech-stack.md` o aprobadas por el usuario

Reglas:
- Si la spec usa tecnologías o librerías no definidas ni aprobadas, preguntar al usuario y ofrecer opciones con pros y contras.
- Nunca elegir ni asumir tecnologías o librerías sin aprobación explícita del usuario.

Salida:
- aprobable / no aprobable
- faltantes accionables
