<div align="center">

# ⌃⌥ CtrlAltLazy

**Work smarter, not harder.** A free, open collection of AI skills, agents, repos and tools I actually use — organised so you can grab what you need and go.

[Skills](#-skills) · [GitHub Repos](#-github-repos-worth-starring) · [LLM Agents](#-llm-agents) · [Tools & Cool Stuff](#-tools--cool-stuff) · [Install a skill](#-how-to-install-a-skill) · [Contribute](CONTRIBUTING.md)

</div>

---

## 🧠 Skills

Skills are folders with a `SKILL.md` file that teach an AI agent (**Google Gemini**, **ChatGPT**, **Claude**, Claude Code, or any agent that reads skill files) how to do a specific job exceptionally well. Everything lives in [`/skills`](skills), grouped by category.

### 💼 PM Stuff

| Skill | What it does | Link |
|---|---|---|
| **PM Interview Prep** | Reads your CV, researches the target company + JD, and builds a private web app of 50–90 likely PM interview questions with spoken answers, live examples from *your* resume, and best-outcome guidance. Then runs a live mock interview with scoring. Covers APM → CPO, AI PM, platform, growth, B2B. | [`skills/pm/pm-interview-prep`](skills/pm/pm-interview-prep) |
| **PM Resume Prep** | Audits, stress-tests, and rebuilds any PM resume (APM → CPO) for ATS compliance and executive hiring standards. Delivers a 0–100 match score, stress-test audit, gap analysis, and humanizer pass, then drafts an ATS-friendly HTML resume and print-ready A4 PDF. Built for Google Gemini, ChatGPT, and Claude. | [`skills/pm/pm-resume-prep`](skills/pm/pm-resume-prep) |

### 🙋 Personal Stuff

| Skill | What it does | Link |
|---|---|---|
| _Coming soon_ | | |

### ⚡ Productivity

| Skill | What it does | Link |
|---|---|---|
| _Coming soon_ | | |

---

## ⭐ GitHub Repos Worth Starring

Other people's repos I've found useful. Free to clone.

| Repo | Why it's here |
|---|---|
| _Add a repo_ — `[owner/repo](https://github.com/owner/repo)` | _One line on why it's useful_ |

---

## 🤖 LLM Agents

Agents, frameworks and agent setups worth trying.

| Agent | What it does | Link |
|---|---|---|
| _Add an agent_ | | |

---

## 🧰 Tools & Cool Stuff

Anything else interesting — prompts, MCP servers, templates, articles, videos.

| Name | Type | What it is | Link |
|---|---|---|---|
| _Add something_ | _Tool / Prompt / MCP / Article / Video_ | | |

---

## 📥 How to Install a Skill

**Download just one skill folder** — paste the folder URL (e.g. `https://github.com/SridharIyer10/CtrlAltLazy/tree/main/skills/pm/pm-resume-prep`) into [download-directory.github.io](https://download-directory.github.io/), or clone the whole repo:

```bash
git clone https://github.com/SridharIyer10/CtrlAltLazy.git
```

### 1. Google Gemini (Gemini Advanced, Gems, Canvas)
- **Gemini Gems:** Create a new Gem at [gemini.google.com/gems](https://gemini.google.com/gems) and paste the skill's `SKILL.md` into the Gem instructions.
- **Gemini Chat / Canvas:** Copy and paste the `SKILL.md` directly into the chat alongside your prompt, CV, or JD. Gemini Canvas will render documents and code directly.

### 2. ChatGPT (GPT-4o, Custom GPTs, Canvas)
- **Custom GPTs:** Go to [chatgpt.com/gpts/editor](https://chatgpt.com/gpts/editor), paste `SKILL.md` into the **Instructions**, and upload any bundled reference files (e.g. `references/humanizer-patterns.md`) into Knowledge.
- **ChatGPT Canvas / Chat:** Paste `SKILL.md` into your Custom Instructions or the active chat. ChatGPT Canvas will open and preview code/HTML outputs side-by-side.

### 3. Claude (Claude.ai, Projects, Desktop, Claude Code)
- **Claude.ai / Desktop:** 
  1. Zip the skill folder (or run `./scripts/package-skills.sh` — zips land in `dist/`).
  2. Go to **Settings → Capabilities → Skills → Upload skill** and pick the zip.
  3. Or create a **Project** and paste `SKILL.md` into Project Instructions.
- **Claude Code:**
  ```bash
  # personal (all projects)
  cp -r skills/pm/pm-resume-prep ~/.claude/skills/
  # or per project
  cp -r skills/pm/pm-resume-prep .claude/skills/
  ```

---

## 🗂️ Repo Structure

```
CtrlAltLazy/
├── README.md                 ← you are here (the index of everything)
├── CONTRIBUTING.md           ← how to add a skill or a link
├── skills/
│   ├── pm/                   ← PM Stuff
│   │   ├── pm-interview-prep/
│   │   │   ├── SKILL.md
│   │   │   └── README.md
│   │   └── pm-resume-prep/
│   │       ├── SKILL.md
│   │       ├── README.md
│   │       ├── assets/
│   │       ├── references/
│   │       └── scripts/
│   ├── personal/             ← Personal Stuff
│   └── productivity/         ← Productivity
├── templates/
│   └── skill-template/       ← copy this to start a new skill
└── scripts/
    └── package-skills.sh     ← zips every skill into dist/ for upload
```

Adding a new category? Create `skills/<category>/`, then add a matching section under [Skills](#-skills). Details in [CONTRIBUTING.md](CONTRIBUTING.md).

---

## 📜 License

[MIT](LICENSE) — free to use, copy, and modify. Links to third-party repos and tools are under their own licenses.

<div align="center"><sub>Built by <a href="https://github.com/SridharIyer10">Sridhar Iyer</a> · If something here saved you time, drop a ⭐</sub></div>
