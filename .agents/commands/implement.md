Objetivo: implementar una spec aprobada, validar y cerrar.

Proceso:
1) Cargar spec indicada.
2) Validar estado:
   - Si `status != approved`: detener y devolver error claro.
3) Implementar según plan de implementación.
4) Ejecutar validaciones de la spec.
5) Actualizar spec a `implemented`.
6) Mover spec a `specs/archive/` y marcar `archived`.
7) Entregar resumen final:
   - cambios realizados
   - validaciones ejecutadas
   - riesgos residuales
   - siguientes pasos

Reglas:
- No cambiar objetivos sin enmienda explícita.
- Si aparecen bloqueos: pausar y regresar a `ready_for_review`.
