#!/usr/bin/env bash
# Genera, a partir de .agents/commands/ (fuente única), los comandos
# equivalentes para otros agentes:
#   - Claude Code -> .claude/commands/<nombre>.md      (copia literal)
#   - opencode    -> .opencode/commands/<nombre>.md    (copia literal)
#   - Goose       -> .goose/recipes/<nombre>.yaml      (recipe YAML generada)
#
# Uso (desde la raíz del proyecto, tras instalar .agents/):
#   .agents/scripts/sync-commands.sh
#
# Es seguro re-ejecutarlo: los archivos generados se sobrescriben siempre
# (son derivados; la fuente de verdad sigue siendo .agents/commands/).
set -euo pipefail

ROOT="$PWD"
SRC="$ROOT/.agents/commands"

[[ -d "$SRC" ]] || { echo "No existe $SRC (¿ejecutaste install.sh?)" >&2; exit 1; }

CLAUDE_DIR="$ROOT/.claude/commands"
OPENCODE_DIR="$ROOT/.opencode/commands"
GOOSE_DIR="$ROOT/.goose/recipes"

mkdir -p "$CLAUDE_DIR" "$OPENCODE_DIR" "$GOOSE_DIR"

count=0
for src_file in "$SRC"/*.md; do
  [[ -e "$src_file" ]] || continue
  name="$(basename "$src_file" .md)"

  # Copia literal: Claude Code y opencode aceptan markdown plano sin frontmatter.
  cp "$src_file" "$CLAUDE_DIR/$name.md"
  cp "$src_file" "$OPENCODE_DIR/$name.md"

  # Goose: su unidad invocable es una Recipe YAML, no un .md suelto.
  # Se extrae la descripción de la primera línea ("Objetivo: ...") y se
  # envuelve el cuerpo completo del comando en `instructions:`.
  first_line="$(head -n 1 "$src_file")"
  description="${first_line#Objetivo: }"
  description="${description//\"/\\\"}"

  {
    echo "version: 1.0.0"
    echo "title: $name"
    echo "description: \"$description\""
    echo "instructions: |"
    sed 's/^/  /' "$src_file"
  } > "$GOOSE_DIR/$name.yaml"

  count=$((count + 1))
done

echo "Sincronizados $count comandos:"
echo "  - $CLAUDE_DIR/*.md"
echo "  - $OPENCODE_DIR/*.md"
echo "  - $GOOSE_DIR/*.yaml"
echo
echo "Nota (Goose): registra cada recipe como slash command en tu config.yaml, p. ej.:"
echo '  slash_commands:'
echo '    feature: { recipe: ".goose/recipes/feature.yaml" }'
