Objetivo: completar los documentos de contexto del proyecto (`docs/project.md`, `docs/tech-stack.md`, `docs/architecture.md`, `docs/conventions.md`).
Contexto: leer los 4 documentos y explorar el repo en solo lectura.

Proceso:
1) Detectar estado: un doc está vacío si conserva placeholders `<...>`. Si ya está completo, preguntar: sobrescribir, completar solo lo faltante u omitir.
2) Escanear el repo en solo lectura (omitir si está vacío; en ese caso preguntar todo):
   - Stack: `package.json`, `pyproject.toml`, `requirements.txt`, `go.mod`, `Cargo.toml`, `pom.xml`, `composer.json`, `Gemfile`, `*.csproj`, lockfiles, `.nvmrc`, `.tool-versions`.
   - Infra: `Dockerfile`, `docker-compose*`, `.github/workflows`, `.gitlab-ci.yml`, `terraform/`, `k8s/`.
   - Convenciones: `.editorconfig`, configs de eslint/prettier/ruff/black/tsconfig, config de tests, `CONTRIBUTING.md`, `git log` y ramas.
   - Arquitectura: árbol de carpetas, entrypoints, README.
   - Proyecto: nombre y descripción desde README o manifiestos.
3) Entrevistar por documento en este orden: project, tech-stack, architecture, conventions.
   - Mostrar primero lo detectado y pedir confirmación.
   - Preguntar solo lo no inferible (propósito, alcance, usuarios, glosario, restricciones, decisiones, integraciones).
   - Pocas preguntas por tanda, sin repetir.
4) Escribir cada doc respetando las secciones de su plantilla. No implementes nada ni modifiques código; solo escribe en `docs/`.
5) Devuelve:
   - docs completados
   - datos inferidos del repo vs respondidos por el usuario
   - pendientes marcados `TBD`

Reglas:
- No inventar datos: sin evidencia ni respuesta -> `TBD`.
- Solo escribir en `docs/`; no modificar código.
- Idempotente: se puede re-ejecutar para completar pendientes.
- Preguntas en español, cortas y precisas.
