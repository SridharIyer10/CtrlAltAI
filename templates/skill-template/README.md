# Your Skill Name

One-line summary of what the skill does and who it is for.

## What you get

- Bullet list of the concrete deliverables

## 🖼️ Output preview

<!-- REQUIRED if the skill outputs HTML, a web app, PDF, image or any visual file.
     Add assets/preview.png (a screenshot) and, for HTML, a sample file such as assets/sample-output.html.
     If the output is plain text only, replace this section with one line: "Text only — no visual output." -->

![Output preview](assets/preview.png)

## Try it

> "Example prompt that triggers this skill"

## 📥 Install

Pick your platform, then your device. Every path ends with the same check: **start a new chat and run the test prompt below**.

> Get the files first: `git clone https://github.com/SridharIyer10/CtrlAltAI.git`, then open `skills/<category>/<skill-name>`. To make an upload-ready zip, run `./scripts/package-skills.sh` from the repo root (the zip lands in `dist/<skill-name>.zip`).

### Claude

| Device | Steps |
|---|---|
| **Web** (claude.ai) | 1. Open [claude.ai](https://claude.ai) → **Settings → Capabilities → Skills**.<br>2. Click **Upload skill** and choose `dist/<skill-name>.zip`.<br>3. Switch the skill **On**.<br>4. Start a new chat and run the test prompt. |
| **Desktop** (Mac / Windows) | 1. Open the Claude desktop app → **Settings → Capabilities → Skills**.<br>2. Click **Upload skill** and choose `dist/<skill-name>.zip`.<br>3. Switch the skill **On**, start a new chat, and run the test prompt. |
| **App** (iOS / Android) | 1. Upload the skill once on web or desktop (steps above). Skills are tied to your account, so it syncs to the app.<br>2. Open the Claude app, start a new chat, and run the test prompt.<br>3. No skill option? Create a **Project** on web, paste `SKILL.md` into its instructions, then open that Project in the app. |
| **Command line** (Claude Code) | See the commands below. |

```bash
# Install for all your projects
mkdir -p ~/.claude/skills && cp -r skills/<category>/<skill-name> ~/.claude/skills/

# Or for one project only
mkdir -p .claude/skills && cp -r skills/<category>/<skill-name> .claude/skills/

# Run it
claude
```

### ChatGPT

| Device | Steps |
|---|---|
| **Web** (chatgpt.com) | 1. Open [chatgpt.com/gpts/editor](https://chatgpt.com/gpts/editor) (**Explore GPTs → Create**).<br>2. Under **Configure**, paste all of `SKILL.md` into **Instructions**.<br>3. Upload any files from `references/` or `assets/` that the skill needs (delete this step if none).<br>4. Click **Create**, choose **Only me**, then run the test prompt. |
| **Desktop** (Mac / Windows) | 1. Create the GPT on the web (steps above).<br>2. Open the ChatGPT desktop app, pick your GPT from the sidebar, and run the test prompt.<br>3. No GPT access? Paste `SKILL.md` as the first message of a chat, then send the test prompt. |
| **App** (iOS / Android) | 1. Create the GPT on the web (steps above).<br>2. Open the ChatGPT app → sidebar → your GPT, and run the test prompt.<br>3. No GPT access? Paste `SKILL.md` as the first message, then the test prompt. |
| **Command line** (Codex CLI) | See the commands below. |

```bash
# Codex CLI reads AGENTS.md from the current folder
cp skills/<category>/<skill-name>/SKILL.md ./AGENTS.md
codex "<Example prompt that triggers this skill>"
```

### Google Gemini

| Device | Steps |
|---|---|
| **Web** (gemini.google.com) | 1. Open [gemini.google.com/gems](https://gemini.google.com/gems) → **New Gem**.<br>2. Name it `<Skill Name>` and paste all of `SKILL.md` into **Instructions**.<br>3. Attach any files from `references/` or `assets/` that the skill needs (delete this step if none).<br>4. Click **Save**, open the Gem, and run the test prompt. |
| **Desktop** (Mac / Windows) | 1. Gemini runs in the browser on desktop. Create the Gem on the web (steps above).<br>2. Optional: in Chrome, open the address bar's install icon (or **⋮ → Cast, save and share → Install page as app**) to pin Gemini as a desktop app.<br>3. Open your Gem and run the test prompt. |
| **App** (iOS / Android) | 1. Create the Gem on the web (steps above).<br>2. Open the Gemini app → **Gems** → your Gem, and run the test prompt.<br>3. No Gems access? Paste `SKILL.md` as the first message, then the test prompt. |
| **Command line** (Gemini CLI) | See the commands below. |

```bash
# Gemini CLI reads GEMINI.md from the current folder
cp skills/<category>/<skill-name>/SKILL.md ./GEMINI.md
gemini -p "<Example prompt that triggers this skill>"
```

### ✅ Test prompt (all platforms)

> <Example prompt that triggers this skill>

If the reply follows the steps described in [`SKILL.md`](SKILL.md), the install worked.

## ⌨️ Command-line prompts

Copy, edit the `[brackets]`, and paste into the CLI (or into any chat).

```bash
# Claude Code
claude "<prompt that triggers this skill>"

# Codex CLI (ChatGPT)
codex "<prompt that triggers this skill>"

# Gemini CLI
gemini -p "<prompt that triggers this skill>"
```

## Files

- [`SKILL.md`](SKILL.md) — the skill itself
- [`assets/preview.png`](assets/preview.png) — screenshot of the output
