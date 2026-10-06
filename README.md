<div align="center">

# ⌃⌥ CtrlAltAI

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
| [multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills) | **What it does:** One `CLAUDE.md` file that stops AI coding assistants making the usual mistakes Andrej Karpathy pointed out — guessing instead of asking, over-building, and touching code you didn't ask about. It has 4 rules: *think before coding*, *keep it simple*, *only change what's needed*, *define "done" and check it*.<br>**When to use it:** Any time you let Claude Code or Cursor edit a real codebase and want small, careful changes instead of big rewrites.<br>**Best for:** Existing projects, team repos and production code where a wrong edit is costly.<br>**How quick:** ~5 minutes. Claude Code: `/plugin marketplace add forrestchang/andrej-karpathy-skills`, or just copy `CLAUDE.md` into your project. Cursor picks up the included rules automatically.<br>**In short:** A cheap, no-setup way to make your AI coder more careful. MIT licensed. |
| [obra/superpowers](https://github.com/obra/superpowers) | **What it does:** A complete "how to build software" playbook for AI coding agents — 20+ skills covering brainstorming, writing a spec, planning, test-driven development (red → green → refactor), step-by-step debugging, code review and splitting work across sub-agents.<br>**When to use it:** When you want the agent to plan first and then work on its own for a long stretch without going off track.<br>**Best for:** Bigger, multi-step builds — new features, new apps, anything where a plan and tests matter more than a quick fix.<br>**How quick:** One command. Claude Code: `/plugin install superpowers@claude-plugins-official`. Also works with Cursor, Copilot CLI, Codex, Gemini, Devin and 10+ others. The skills switch on by themselves — no special commands to learn.<br>**In short:** Turns your AI from "jumps straight into code" into a disciplined senior engineer. Overkill for one-line fixes. MIT licensed. |
| [alibaba/page-agent](https://github.com/alibaba/page-agent) | **What it does:** A JavaScript library that puts an AI agent *inside your web page*. Users type plain English ("fill this form with my last order", "go to settings and turn on 2FA") and it clicks buttons and fills fields for them. It reads the page's HTML, not screenshots, so it's fast and cheap.<br>**When to use it:** When you want to add an AI copilot to your own web app without browser extensions, Python or a headless browser.<br>**Best for:** SaaS products, admin panels, ERP/CRM tools with long forms, and accessibility (letting people control a site by talking to it).<br>**How quick:** Minutes. Try it with one line: `<script src="https://cdn.jsdelivr.net/npm/page-agent@1.12.4/dist/iife/page-agent.demo.js"></script>` (uses a free test model). For real use: `npm install page-agent`, add your LLM key, call `agent.execute('...')`.<br>**Good to know:** Works with most mainstream LLMs, including locally hosted ones. An optional Chrome extension lets it work across multiple pages. MIT licensed. |

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

Each skill's own README has step-by-step install instructions for **Claude**, **ChatGPT** and **Gemini** on **web, desktop, mobile app and command line**, plus copy-paste prompts. Open the skill folder and follow its **Install** section:

- [PM Interview Prep → Install](skills/pm/pm-interview-prep/README.md#-install)
- [PM Resume Prep → Install](skills/pm/pm-resume-prep/README.md#-install)

Quick start:

```bash
git clone https://github.com/SridharIyer10/CtrlAltAI.git
cd CtrlAltAI
./scripts/package-skills.sh          # zips each skill into dist/ for Claude upload
cp -r skills/pm/pm-resume-prep ~/.claude/skills/   # Claude Code
```

Or download just one skill folder: paste its GitHub URL into [download-directory.github.io](https://download-directory.github.io/).

---

## 🗂️ Repo Structure

```
CtrlAltAI/
├── README.md                 ← you are here (the index of everything)
├── CONTRIBUTING.md           ← skill rules + how to add a skill or a link
├── skills/
│   ├── pm/                   ← PM Stuff
│   │   ├── pm-interview-prep/
│   │   │   ├── SKILL.md
│   │   │   ├── README.md
│   │   │   └── assets/
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
    ├── check-skills.sh       ← pre-deploy check (run before every push)
    └── package-skills.sh     ← zips every skill into dist/ for upload
```

Adding a new category? Create `skills/<category>/`, then add a matching section under [Skills](#-skills). Details in [CONTRIBUTING.md](CONTRIBUTING.md).

---

## 📜 License

[MIT](LICENSE) — free to use, copy, and modify. Links to third-party repos and tools are under their own licenses.

<div align="center"><sub>Built by <a href="https://github.com/SridharIyer10">Sridhar Iyer</a> · If something here saved you time, drop a ⭐</sub></div>
