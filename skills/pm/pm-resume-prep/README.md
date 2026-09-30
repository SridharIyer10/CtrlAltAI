# PM Resume Prep

Audits, stress-tests, and rebuilds any Product Manager resume (Associate PM to CPO) for ATS compliance, architectural depth, and executive hiring standards. 

Designed to run natively across **Google Gemini**, **ChatGPT**, and **Claude**.

---

## What you get

- **Hard Core Match Score (0–100%)** — Calibrated by years of experience (<5 yrs, 5–10 yrs, 10–15 yrs, 15+ yrs) across 6 dimensions: Scope & Scale, AI/ML Maturity, Leadership Level, Execution & Craft, JD Coverage, and ATS presentation.
- **Stress-Test Audit** — Quotes exact phrases from your CV across 5 failure points: Buzzword Bleed, Metric Voids, Vague Architectural Claims, Undersold Technical Capital, and ATS/Format Penalties.
- **Gap Analysis** — Categorizes missing elements into Critical AI/Domain Imperatives, Business & Scale Gaps, and Tooling/Keywords, tagged as `[Likely have, not shown]` or `[True gap]`.
- **The 3 Weakest Bullets Rewritten** — Original vs. critique vs. executive rewrite using Google's **X-Y-Z formula** (*Accomplished [X], as measured by [Y], by doing [Z]* with bold metrics).
- **Humanizer Pass** — Strips robotic AI writing clichés, superficial `-ing` endings, and corporate fluff, keeping your authentic voice.
- **ATS-Friendly HTML & A4 PDF** — Single-column, semantic HTML with strict print CSS (`break-inside: avoid` on every company card). Renders a clean PDF of at most 3 pages.

---

## 🌐 Platform Setup Guides

### 1. Claude (Claude.ai / Projects / Claude Code)
- **Claude.ai / Desktop**: 
  1. Package the skill using `./scripts/package-skills.sh` (or zip `skills/pm/pm-resume-prep/`).
  2. In Claude Desktop / Claude.ai, upload the zip under **Settings → Capabilities → Skills**, OR paste `SKILL.md` into a Project's Custom Instructions.
  3. Claude will render the final resume as an interactive **HTML Artifact** with a live visual preview and one-click print.
- **Claude Code**:
  ```bash
  cp -r skills/pm/pm-resume-prep ~/.claude/skills/
  ```

### 2. ChatGPT (GPT-4o / Custom GPTs / Canvas)
- **Custom GPT**:
  1. Create a new GPT in ChatGPT.
  2. Paste the contents of [`SKILL.md`](SKILL.md) into the **Instructions** box.
  3. Optionally upload `references/humanizer-patterns.md` into the GPT's Knowledge files.
- **Standard Chat / Canvas**:
  1. Paste `SKILL.md` into the conversation or your Custom Instructions.
  2. ChatGPT Canvas will open the HTML resume side-by-side for live review, or deliver it in a single copyable HTML code block.

### 3. Google Gemini (Gemini Advanced / Gemini Gems / Canvas)
- **Gemini Gem**:
  1. Create a Gem in Google Gemini.
  2. Paste the contents of [`SKILL.md`](SKILL.md) into the Gem's instructions.
- **Standard Chat / Canvas**:
  1. Paste `SKILL.md` along with your resume and target JD.
  2. Gemini generates the assessment and outputs the complete standalone HTML in Canvas or a Markdown code block with 1-click copy.

---

## 🖨️ How to Export to PDF

### Method A: Universal 1-Click Browser Print (Works on all platforms)
1. Copy or download the final HTML output and save it as `resume.html`.
2. Double-click to open in Google Chrome, Microsoft Edge, Safari, or Firefox.
3. Press `Cmd + P` (Mac) or `Ctrl + P` (Windows).
4. Select Destination: **Save as PDF** | Paper Size: **A4** | Margins: **Default / None**.
5. Save. The embedded CSS guarantees clean pagination under 3 pages with zero split company blocks.

### Method B: Automated CLI Script (Playwright)
If you have Python installed locally or run via Claude Code / Antigravity:
```bash
# Install dependencies if needed
pip install playwright pdfplumber
playwright install chromium

# Render and validate layout
python3 skills/pm/pm-resume-prep/scripts/render_pdf.py /path/to/resume.html /path/to/resume.pdf
```

---

## Try it

> "Audit my PM resume against this Senior PM JD at Stripe: [paste resume & JD]"

> "Score my resume for a Director of Product role in B2B SaaS and give me an honest assessment."

> "Rebuild my product manager CV to be ATS-friendly and highlight my AI/LLM experience."

---

## Files

- [`SKILL.md`](SKILL.md) — The core multi-platform skill definition
- [`assets/resume-template.html`](assets/resume-template.html) — Standalone ATS-friendly HTML template
- [`references/humanizer-patterns.md`](references/humanizer-patterns.md) — Exhaustive AI-writing pattern reference
- [`scripts/render_pdf.py`](scripts/render_pdf.py) — Playwright A4 PDF renderer and layout validator
