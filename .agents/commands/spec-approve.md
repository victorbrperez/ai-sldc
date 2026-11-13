Objetivo: aprobar una spec para habilitar implementación.

Checklist mínimo:
- Objetivo claro
- Alcance incluye/no incluye
- Criterios de aceptación verificables
- Plan de validación
- Riesgos y mitigaciones
- Plan de rollback

Proceso:
1) Cargar spec.
2) Ejecutar checklist.
3) Si cumple:
   - `status: approved`
   - `approval.approved_by`
   - `approval.approved_at`
4) Si no cumple:
   - mantener estado
   - listar faltantes concretos
