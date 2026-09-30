# Contributing / Adding Stuff

## Add a new skill

1. Copy the template into the right category:
   ```bash
   cp -r templates/skill-template skills/<category>/<skill-name>
   ```
   Categories: `pm`, `personal`, `productivity` (or create a new folder).
2. Edit `SKILL.md` — the `name` and `description` in the frontmatter are what the agent uses to decide when to trigger the skill, so make the description specific.
3. Edit the skill's `README.md` — fill in every section (see the [Skill rules](#-skill-rules-mandatory--check-before-every-deployment)).
4. Add a row to the matching table in the root [README.md](README.md#-skills).
5. Run `./scripts/check-skills.sh`.

**Naming:** folder names in `kebab-case`, and the folder name should match `name:` in `SKILL.md`.

## Add a new category

1. `mkdir skills/<category>`
2. Add a new `### <emoji> <Category Name>` section with a table under **Skills** in the root README.
3. Add it to the Repo Structure tree.

## Add a link (repo, agent, tool)

Add one row to the matching table in the root README:

```markdown
| [owner/repo](https://github.com/owner/repo) | One line on why it's useful |
```

Keep descriptions to one line. Delete the `_Add a ..._` placeholder row once the table has a real entry.

## ✅ Skill rules (mandatory — check before every deployment)

A skill is only deployable when **all** of these are true. `./scripts/check-skills.sh` enforces them automatically.

1. **One folder per skill**, at `skills/<category>/<skill-name>/`, containing `SKILL.md` **and** `README.md`. Folder name is `kebab-case` and matches `name:` in `SKILL.md`.
2. **`README.md` explains the skill** with these sections: *What you get*, *Output preview*, *Try it*, *Install*, *Command-line prompts*, *Files*.
3. **Show the output.** If the skill produces HTML, a web app, PDF, image or any visual file, the README has an **Output preview** section with a screenshot (`assets/preview.png`) and, for HTML, a sample file (`assets/sample-output.html`) people can open. Text-only skills say so in one line.
4. **Install instructions for all 3 platforms × all 4 surfaces.** Claude, ChatGPT and Gemini, each with a row for **Web**, **Desktop**, **App** (iOS / Android) and **Command line**. Steps are numbered, one action per step, with exact menu names and links. End with a **test prompt** so the reader can confirm it worked.
5. **Command-line prompts.** A copy-paste bash block with a prompt for Claude Code (`claude`), Codex CLI (`codex`) and Gemini CLI (`gemini -p`), plus any helper commands (e.g. PDF export).
6. **Root README updated.** The skill has a row in the matching table of [README.md](README.md#-skills) and appears in the Repo Structure tree.
7. **No secrets or personal data** — no API keys, tokens, CVs, or company-confidential info. Never commit a remote URL with a token in it.
8. **Every link and file the README mentions exists.**

Start from `templates/skill-template`. It already contains every required section.

### Before you deploy

```bash
./scripts/check-skills.sh     # must print "All skill checks passed"
./scripts/package-skills.sh   # rebuilds dist/*.zip (not committed)
git add -A && git commit -m "Add <skill-name>" && git push
```

If the check fails, fix what it lists and re-run. Do not push until it passes.

## Skill checklist

- [ ] `SKILL.md` has `name` + `description` frontmatter; folder name matches `name`
- [ ] `README.md` has all six required sections
- [ ] Output preview (screenshot + sample file) added if the output is visual/HTML
- [ ] Install steps for Claude, ChatGPT, Gemini × Web, Desktop, App, Command line
- [ ] Command-line prompts block and a test prompt
- [ ] Row added to root README
- [ ] No personal data, API keys, or company-confidential info
- [ ] `./scripts/check-skills.sh` passes
