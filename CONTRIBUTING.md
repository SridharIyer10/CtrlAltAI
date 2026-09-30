# Contributing / Adding Stuff

## Add a new skill

1. Copy the template into the right category:
   ```bash
   cp -r templates/skill-template skills/<category>/<skill-name>
   ```
   Categories: `pm`, `personal`, `productivity` (or create a new folder).
2. Edit `SKILL.md` — the `name` and `description` in the frontmatter are what the agent uses to decide when to trigger the skill, so make the description specific.
3. Edit the skill's `README.md` (short human-readable summary + example prompts).
4. Add a row to the matching table in the root [README.md](README.md#-skills).

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

## Skill checklist

- [ ] `SKILL.md` has `name` + `description` frontmatter
- [ ] No personal data, API keys, or company-confidential info
- [ ] `README.md` explains what it does and how to trigger it
- [ ] Row added to root README
