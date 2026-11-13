---
name: spec-writer
description: Convierte la información de intake en una spec completa usando la plantilla oficial.
---

# Skill: spec-writer

Contexto: leer `docs/project.md`, `docs/architecture.md`, `docs/tech-stack.md` y `docs/conventions.md` cuando aplique; ignorar los que estén sin completar.

Objetivo:
Convertir la información de intake en una spec clara y completa.

Entrada:
- datos de intake
- template oficial

Salida:
- spec en `docs/specs/active/`
- estado sugerido

Reglas:
- 1 solicitud = 1 spec.
- Criterios de aceptación testeables.
- Redacción concreta, sin ambigüedad.
- Si usa una tecnología o librería definida en `docs/tech-stack.md`, aplicarla sin preguntar.
- Si requiere una no definida, preguntar al usuario y ofrecer opciones con pros y contras.
- Nunca elegir ni asumir tecnologías o librerías sin aprobación explícita del usuario.
