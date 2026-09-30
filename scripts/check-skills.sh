#!/usr/bin/env bash
# Pre-deployment gate. Fails (exit 1) if any skill breaks the rules in CONTRIBUTING.md.
# Run: ./scripts/check-skills.sh
set -uo pipefail
cd "$(dirname "$0")/.."
fail=0
err() { echo "  ✗ $1"; fail=1; }

# Every skill = a folder with SKILL.md under skills/. The template is checked too.
dirs=$(find skills templates -name SKILL.md -exec dirname {} \; | sort)
[ -n "$dirs" ] || { echo "No skills found"; exit 1; }

for d in $dirs; do
  echo "▸ $d"
  name=$(basename "$d")
  is_template=0; [[ "$d" == templates/* ]] && is_template=1

  # 1. Frontmatter
  grep -q '^name:' "$d/SKILL.md" || err "SKILL.md missing 'name:' frontmatter"
  grep -q '^description:' "$d/SKILL.md" || err "SKILL.md missing 'description:' frontmatter"
  if [ $is_template -eq 0 ]; then
    grep -q "^name: *\"\?$name\"\?\$" "$d/SKILL.md" || err "folder name '$name' does not match 'name:' in SKILL.md"
  fi

  # 2. README exists
  r="$d/README.md"
  [ -f "$r" ] || { err "README.md missing"; continue; }
  for h in "What you get" "Try it" "Install" "Command-line prompts" "Files"; do
    grep -qE "^## .*$h" "$r" || err "README missing section: $h"
  done

  # 3. Install instructions: 3 platforms x (Web, Desktop, App, Command line)
  for p in Claude ChatGPT Gemini; do
    grep -qE "^### .*$p" "$r" || err "README missing install section for $p"
  done
  for dev in "Web" "Desktop" "App" "Command line"; do
    n=$(grep -cE "^\| \*\*$dev\*\*" "$r")
    [ "$n" -ge 3 ] || err "README install tables need a '$dev' row for each of Claude, ChatGPT, Gemini (found $n)"
  done
  grep -q '^```bash' "$r" || err "README has no command-line code block"
  grep -qi "test prompt" "$r" || err "README has no test prompt"

  # 4. Output preview: required whenever the skill produces a visual/file output
  if grep -qiE 'html|web app|pdf|artifact|image|png|slides|dashboard' "$d/SKILL.md"; then
    grep -qE "^## .*Output preview" "$r" || err "README missing 'Output preview' section (skill has HTML/visual output)"
    img=$(grep -oE '!\[[^]]*\]\([^)]+\)' "$r" | head -1 | sed -E 's/.*\(([^)]+)\)/\1/')
    [ -n "$img" ] || err "Output preview has no image"
    [ -z "$img" ] || [ -f "$d/$img" ] || err "preview image not found: $d/$img"
  fi

  # 5. Every relative link in the README resolves (template links are placeholders)
  if [ $is_template -eq 0 ]; then grep -oE '\]\((\.?/?[A-Za-z0-9_./-]+)\)' "$r" | sed -E 's/^\]\((.*)\)$/\1/' | grep -vE '^(https?:|#)' | sort -u | while read -r l; do
    [ -e "$d/$l" ] || echo "  ✗ broken link in README: $l"
  done | grep -q . && err "README has broken relative links"; fi

  # 6. Root README lists the skill
  if [ $is_template -eq 0 ]; then
    grep -q "$d" README.md || err "root README.md has no row linking to $d"
  fi
done

# 7. No secrets anywhere tracked or about to be
if git grep -nIE 'ghp_[A-Za-z0-9]{20,}|sk-[A-Za-z0-9]{20,}|AIza[0-9A-Za-z_-]{30,}|-----BEGIN [A-Z ]*PRIVATE KEY' -- . >/dev/null 2>&1; then
  echo "▸ secrets"; err "possible secret found in tracked files (run: git grep -nIE 'ghp_|sk-|AIza')"
fi

echo
if [ $fail -eq 0 ]; then echo "✅ All skill checks passed — safe to deploy."; else echo "❌ Fix the issues above before deploying."; exit 1; fi
