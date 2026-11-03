#!/usr/bin/env bash
set -euo pipefail

client="${1:-both}"
dest="${DESTINATION:-}"
force="${FORCE:-0}"
root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

skills=()
for dir in "$root"/*/; do
  if [ -f "$dir/SKILL.md" ]; then
    skills+=("$dir")
  fi
done

if [ ${#skills[@]} -eq 0 ]; then
  echo "Nenhuma skill encontrada em $root" >&2
  exit 1
fi

targets=()
if [ -n "$dest" ]; then
  targets+=("$dest")
else
  if [ "$client" = "opencode" ] || [ "$client" = "both" ]; then
    if [ -d "$HOME/.config/opencode" ]; then
      targets+=("$HOME/.config/opencode/skills")
    fi
  fi
  if [ "$client" = "cursor" ] || [ "$client" = "both" ]; then
    if [ -d "$HOME/.cursor" ]; then
      targets+=("$HOME/.cursor/skills")
    fi
  fi
fi

if [ ${#targets[@]} -eq 0 ]; then
  echo "Nenhum cliente encontrado para '$client'. Use DESTINATION=<pasta>." >&2
  exit 1
fi

for target in "${targets[@]}"; do
  mkdir -p "$target"

  for dir in "${skills[@]}"; do
    name="$(basename "$dir")"

    if [ -e "$target/$name" ] && [ "$force" != "1" ]; then
      echo "skip    $name -> $target (ja existe, use FORCE=1 para sobrescrever)"
      continue
    fi

    rm -rf "${target:?}/$name"
    cp -R "$dir" "$target/$name"
    find "$target/$name" -name '*.log' -delete

    echo "install $name -> $target"
  done
done

echo ""
echo "Pronto. Destinos:"
for target in "${targets[@]}"; do
  echo " - $target"
done
