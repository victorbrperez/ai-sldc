Objetivo: diagnosticar defecto y producir spec de corrección.

Proceso:
1) Entrevista para reproducción mínima y evidencia.
2) Registrar hipótesis de causa raíz (si aplica).
3) No implementar nada.
4) Genera spec en `specs/active/<yyyy-mm-dd>-bugfix-<slug>.md`.
5) Asigna:
   - `type: bugfix`
   - `status: draft` (o `ready_for_review` si completa)
6) Devuelve resumen, evidencia faltante, path y estado.

Preguntas mínimas:
- ¿Síntoma exacto?
- ¿Pasos de reproducción?
- ¿Esperado vs actual?
- ¿Frecuencia e impacto?
- ¿Logs/evidencia?
- ¿Entorno afectado?
- ¿Criterio de corrección?

Reglas:
- Sin reproducibilidad/evidencia -> `draft`.
- Con diagnóstico razonable + plan validable -> `ready_for_review`.
- No implementar.
