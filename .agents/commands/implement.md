Objetivo: implementar una spec aprobada, validarla, dejar trazabilidad de VCS y cerrarla.
Contexto: leer `docs/project.md`, `docs/architecture.md`, `docs/tech-stack.md` y `docs/conventions.md` cuando aplique; ignorar los que estén sin completar.

Proceso:
1) Cargar spec indicada.
2) Validar estado:
   - Si `status != approved`: detener y devolver error claro.
3) Crear o confirmar la rama de trabajo:
   - usar la convención de ramas de `docs/conventions.md` (sección Git y commits) si existe; si no, `spec/<id>-<slug>`.
   - registrar el nombre en `implementation.branch`.
4) Implementar según plan de implementación (cambios pequeños, reversibles, sin salir del alcance de la spec).
5) Ejecutar validaciones de la spec contra los criterios de aceptación.
   - Si falla: reportar gaps claramente, pausar y regresar la spec a `ready_for_review`.
6) Si pasa: commitear siguiendo `docs/conventions.md`; actualizar spec a `implemented`.
7) Registrar entrega: pedir al usuario la URL/ID del PR o MR (o "sin PR" si el flujo va directo a main) y guardarlo en `implementation.pr`. No asumir ninguna plataforma concreta (GitHub/GitLab/otra).
8) No archivar hasta confirmar que el PR fue revisado y mergeado (o que el push/merge directo ya ocurrió). Mientras tanto, reportar como "pendiente de merge" (p. ej. vía `/spec-status`).
9) Al confirmarse el merge: mover spec a `docs/specs/archive/` y marcar `archived`, manteniendo trazabilidad histórica.
10) Entregar resumen final:
   - cambios realizados
   - validaciones ejecutadas
   - branch y PR
   - riesgos residuales
   - siguientes pasos

Reglas:
- No cambiar objetivos sin enmienda explícita.
- Si aparecen bloqueos: pausar y regresar a `ready_for_review`.
