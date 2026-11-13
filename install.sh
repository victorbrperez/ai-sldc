#!/usr/bin/env bash
# Instala o actualiza el workflow AI SLDC en el proyecto actual.
#
# Uso:
#   install.sh [--update] [--ref <tag|branch>] [--target <dir>]
#
# Instalación: copia .agents/ y docs/ sin sobrescribir archivos existentes.
# Actualización (--update): sobrescribe solo .agents/; nunca toca docs/.
set -euo pipefail

REPO_URL="${AI_SLDC_REPO:-https://github.com/victorbrperez/ai-sldc.git}"
REF="main"
TARGET="$PWD"
UPDATE=false

usage() {
  sed -n '2,8p' "$0" | sed 's/^# \{0,1\}//'
  exit "${1:-0}"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --update) UPDATE=true; shift ;;
    --ref)    REF="${2:?--ref requiere un valor}"; shift 2 ;;
    --target) TARGET="${2:?--target requiere un valor}"; shift 2 ;;
    -h|--help) usage 0 ;;
    *) echo "Opción desconocida: $1" >&2; usage 1 ;;
  esac
done

command -v git >/dev/null || { echo "git es requerido" >&2; exit 1; }
[[ -d "$TARGET" ]] || { echo "Directorio inexistente: $TARGET" >&2; exit 1; }

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Descargando $REPO_URL ($REF)..."
git clone --quiet --depth 1 --branch "$REF" "$REPO_URL" "$TMP_DIR/src"

copy_overwrite() {
  mkdir -p "$TARGET/$1"
  cp -R "$TMP_DIR/src/$1/." "$TARGET/$1/"
}

copy_no_clobber() {
  mkdir -p "$TARGET/$1"
  cp -Rn "$TMP_DIR/src/$1/." "$TARGET/$1/"
}

if [[ "$UPDATE" == true ]]; then
  [[ -d "$TARGET/.agents" ]] || { echo "No hay instalación previa en $TARGET" >&2; exit 1; }
  copy_overwrite ".agents"
  echo "Actualizado .agents/ (docs/ intacto)."
else
  copy_no_clobber ".agents"
  copy_no_clobber "docs"
  echo "Instalado. Siguiente paso: ejecutar /init-project en tu agente."
fi
