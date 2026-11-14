Objetivo: aprobar una spec para habilitar implementación.

Checklist:
- Objetivo claro y medible
- Alcance incluye/no incluye
- Criterios de aceptación verificables
- Plan de validación
- Riesgos y mitigaciones
- Plan de rollback
- Tecnologías y librerías definidas en `docs/tech-stack.md` o aprobadas por el usuario

Proceso:
1) Cargar spec.
2) Ejecutar checklist.
   - Si la spec usa tecnologías o librerías no definidas ni aprobadas, preguntar al usuario y ofrecer opciones con pros y contras. Nunca elegir ni asumir sin aprobación explícita.
3) Si cumple:
   - `status: approved`
   - `approval.approved_by`
   - `approval.approved_at`
4) Si no cumple:
   - mantener estado
   - listar faltantes concretos
