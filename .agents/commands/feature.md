Objetivo: iniciar una nueva funcionalidad y producir una spec en un único archivo.

Proceso:
1) Ejecuta entrevista corta para completar contexto faltante.
2) No implementes nada.
3) Genera spec en `specs/active/<yyyy-mm-dd>-feature-<slug>.md` usando `.agents/templates/spec-template.md`.
4) Asigna:
   - `type: feature`
   - `status: draft` (o `ready_for_review` si está completa)
5) Devuelve:
   - resumen de solicitud
   - preguntas pendientes
   - path de spec
   - estado actual

Preguntas mínimas:
- ¿Qué problema resuelve?
- ¿Resultado esperado medible?
- ¿Qué entra y qué no entra?
- ¿Restricciones técnicas/tiempo?
- ¿Criterios de aceptación?
- ¿Riesgos/dependencias?

Reglas:
- Si faltan datos críticos -> `draft`.
- Si está completa -> `ready_for_review`.
- No ejecutar implementación.
