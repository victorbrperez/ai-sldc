---
name: project-discovery
description: Completa docs/project.md, architecture.md, tech-stack.md y conventions.md extrayendo datos del repo y entrevistando al usuario. Úsala al ejecutar /init-project.
---

# Skill: project-discovery

Objetivo:
Completar los 4 documentos de contexto en `docs/` combinando evidencia del repo y respuestas del usuario.

Entrada:
- estado de `docs/project.md`, `docs/tech-stack.md`, `docs/architecture.md`, `docs/conventions.md`
- contenido del repositorio

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
4) Escribir cada doc respetando las secciones de su plantilla.
5) Resumir: qué se infirió, qué se respondió y qué quedó como `TBD`.

Salida:
- 4 docs actualizados
- resumen con pendientes `TBD`

Reglas:
- No inventar datos: sin evidencia ni respuesta -> `TBD`.
- Solo escribir en `docs/`; no modificar código.
- Idempotente: puede re-ejecutarse para completar pendientes.
- Preguntas en español, cortas y precisas.
