#!/bin/zsh
# Name: log-notes-cli
# Description: Workspace-aware Zsh utility for automated Markdown logging.

log() {
  local d t sec slug f _in target_dir editor_app

  # 1. Configurable Editor & Folder (Sane defaults)
  editor_app="${LOG_EDITOR:-Windsurf}"
  target_dir="${LOG_DIR:-./_log}"  # Defaults to ./_log unless LOG_DIR is set

  # 2. Create Directory
  mkdir -p "$target_dir" 2>/dev/null

  # 3. Generate Timestamps
  d="$(date +%F)"
  t="$(date +%H%M%S)"

  # 4. Handle Section State
  sec="${LOG_SECTION:-}"
  printf "Section (e.g., 2.1.5) [%s]: " "${sec}"
  read -r _in
  [[ -n "$_in" ]] && sec="$_in" && export LOG_SECTION="$sec"
  [[ -z "$sec" ]] && sec="misc"

  # 5. Handle Slug & Filename
  printf "Log Title / Slug: "
  read -r slug

  if [[ -n "$slug" ]]; then
    local clean_slug="${slug:l}"
    clean_slug="${clean_slug// /_}"
    clean_slug="${clean_slug//[^a-z0-9._-]/}"
    f="${target_dir}/${sec}__${d}__${t}__${clean_slug}.md"
  else
    f="${target_dir}/${sec}__${d}__${t}.md"
  fi

  # 6. Initialize File with Metadata
  if [[ ! -f "$f" ]]; then
    echo "# Log: ${slug:-$sec}" > "$f"
    echo "Date: $(date '+%A, %B %d, %Y')" >> "$f"
    echo "Reference: ${sec}" >> "$f"
    echo "ID: ${d}-${t}" >> "$f"
    echo "---" >> "$f"
    echo -e "\n## Context\n- " >> "$f"
  fi

  # 7. Launch Editor (Cross-platform)
  if [[ "$OSTYPE" == "darwin"* ]]; then
    open -a "$editor_app" "$f"
  else
    ${EDITOR:-nano} "$f"
  fi
}

# Safety check
if [[ "${ZSH_EVAL_CONTEXT:-}" =~ :file$ ]]; then
else
    echo "⚠️ Error: This script must be sourced. Add 'source $(pwd)/log.sh' to your .zshrc"
fi