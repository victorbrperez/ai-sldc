Objetivo: preparar un cambio sobre funcionalidad existente y producir una spec.
Contexto: leer `docs/project.md`, `docs/architecture.md`, `docs/tech-stack.md` y `docs/conventions.md` cuando aplique; ignorar los que estén sin completar.

Proceso:
1) Entrevista orientada a estado actual vs estado deseado.
2) No implementes nada.
3) Genera spec en `docs/specs/active/<yyyy-mm-dd>-change-<slug>.md`.
4) Asigna:
   - `type: change`
   - `status: draft` (o `ready_for_review` si completa)
5) Devuelve resumen, gaps, path y estado.

Preguntas mínimas:
- ¿Comportamiento actual?
- ¿Nuevo comportamiento esperado?
- ¿Módulos/áreas afectadas?
- ¿Compatibilidad hacia atrás?
- ¿Criterios de aceptación y pruebas?
- ¿Riesgo de regresión?

Reglas:
- Sin datos críticos -> `draft`.
- Completa -> `ready_for_review`.
- No implementar.
