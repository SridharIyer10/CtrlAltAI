---
name: "pm-interview-prep"
description: "Builds a tailored PM interview prep web app (spoken answers, CV-based live examples, best outcomes) for general or company-specific interviews, then runs a mock interview."
---

# PM Interview Prep

Builds a private web app of likely interview questions with model answers for a Product Manager candidate, tailored to their CV, target level, and (optionally) a specific company and job description. Then offers a live mock interview in chat.

Covers every PM level (APM → CPO) and variants (AI PM, technical PM, platform PM, growth PM, B2B/enterprise PM).

## Non-negotiable rules

- **Never invent the candidate's experience.** Live examples come from the CV. When the CV lacks a number or detail, write the example with a clearly marked placeholder, e.g. `[your number: time-to-schedule before/after]`, and a hint on what to fill in. Never present an invented metric as theirs.
- **Answers are spoken, first person, to the interviewer.** Plain language. Explain any jargon in the same breath. No bullet lists inside the spoken answer.
- **Company facts must be sourced.** Every claim about the company (products, customers, funding, tech stack, news) links to where it came from. If something could not be verified, say so in the brief. Never guess a company's tech stack; say "not public" if not found.
- **Label freshness.** State the research date and which sources were reachable.
- **No fabricated interview-process claims** (e.g. "Company X always asks Y") unless a source says so. Otherwise phrase as "typical for companies like this".

## Step 1 — Intake (ask before doing anything)

Use AskUserQuestion. First call, up to 4 questions:

1. **Interview type:** General PM interview prep, or a specific company?
2. **Target role/level:** APM / PM / Senior PM / Group or Principal PM / Director / VP or Head of Product / CPO (let "Other" capture titles like "AI PM" or "Platform PM").
3. **Total years of experience** (bands: 0–3, 3–6, 6–10, 10–15, 15+) and **years in product management** if different.
4. **Timeline:** interview in under 1 week / 1–3 weeks / 3+ weeks / not scheduled yet (sizes the prep plan).

Then, in plain text (not multiple choice), ask for what is still missing:

- **CV (required):** ask them to attach it (PDF, DOCX or pasted text). Do not proceed without it. If they refuse, fall back to 5–6 questions about their roles, products, team sizes, biggest wins with numbers, one failure, and domains.
- **If specific company:** company name, the job description (paste, file or link), company website or careers page link, any known interview rounds or interviewer names/titles, and anything the recruiter said.
- **If general:** which company types they are targeting (AI-native startup, B2B SaaS scale-up, big tech, enterprise/GCC, consumer, fintech/regulated, etc.) and domain preference.

Skip any question the user has already answered in the conversation.

## Step 2 — Research

Do research before writing any content.

**Tool order:** try WebSearch first. If it is unavailable or blocked, use WebFetch on the links the user gave and on predictable URLs (company homepage, /about, /careers, /blog, /newsroom, /customers, engineering blog, the JD link). If both fail for a source, tell the user which sources were unreachable, ask for pasted text or extra links once, then proceed with what you have and mark those gaps in the brief. Never fetch blocked content by other means (no curl/python workarounds).

**For a specific company, collect:**

- What they sell, to whom, business model and pricing approach, main customer segments, notable customers.
- Products and recent launches (last 12–18 months), especially AI features.
- Technology they build with: public stack clues (engineering blog, JD, job posts), AI/ML approach, platforms and integrations.
- Stage and size: funding or public status, headcount band, geography, India/GCC presence if relevant.
- Recent news: funding, acquisitions, partnerships, leadership changes, layoffs, regulatory issues.
- Competitors and how the company positions against them.
- Culture signals: stated values or leadership principles, how they describe product teams.
- Interview process reports if public (their careers page, reputable write-ups). Mark as "reported".

**Parse the JD into:** must-have requirements, nice-to-haves, level signals (scope, team size, P&L, "own the strategy"), domain keywords, tech/AI keywords, and the 3–5 things this hire will be judged on in year one.

**For general prep:** research how PM interviews currently run for the target level and company types (rounds, formats, take-homes, AI fluency rounds, live prototyping), plus current themes interviewers probe (e.g. AI product judgment, evals, pricing AI, efficiency, platform vs features).

**Always, for the level:** what is expected at this level now. For example, APM/PM: product sense, execution, metrics, estimation. Senior PM: end-to-end ownership, ambiguity, cross-functional influence. Group PM/Director: strategy, managing PMs, org design, stakeholder management with executives. VP/CPO: vision, portfolio bets, P&L, board communication, building the product org, hiring leaders.

## Step 3 — Map the CV

Read the CV fully. Extract, internally:

- Roles, companies (as the candidate names them), dates, scope (team size, reports, budget, ARR/users owned).
- Products and features shipped, with every number the CV states.
- Domains, technical depth, AI experience.
- Leadership evidence: hiring, coaching, reorganizing, conflict, influence.
- 8–12 candidate stories that can be reused across questions (success, failure, conflict, ambiguity, saying no, data-driven decision, launch, leading change, people decision, strategy).
- Gaps versus the JD or level (used to choose questions and to prepare the candidate for probing, not shown as a separate report).

Each live example in Step 5 must point to a specific CV item ("From your CV: interview scheduling agent, 2024–25").

## Step 4 — Plan coverage

Pick 50–90 questions (fewer for APM/PM, more for Director+). Cover every relevant scenario below, weighting by level, company type and JD. Every question gets a `round` tag and a likelihood (`high` or `med`).

**Core PM (all levels)**

- Product sense and design: design a product for X, improve an existing product (use the company's own product when company-specific), favourite product critique.
- Execution and metrics: define success metrics, a metric dropped by 20% — diagnose, north star and metric trees, A/B test design and reading results.
- Prioritization and roadmapping: competing requests, frameworks, saying no, trade-offs under constraints.
- Estimation and analytical (weighted toward APM/PM).
- Technical depth: system basics, APIs, working with engineers, technical trade-offs; AI/LLM depth for AI roles (evals, RAG, agents, cost, latency, safety, failure modes).
- Customer and discovery: research methods, validating problems, B2B discovery with buyers vs users.
- Go-to-market: launches, pricing and packaging, sales and CS collaboration, positioning.
- Stakeholder management: engineering conflict, executive disagreement, influence without authority.
- Behavioral: STAR stories — success, failure, conflict, ambiguity, feedback, deadline pressure, ethical dilemma.
- Motivation: why this company, why this role, why leaving, where in 5 years.

**Senior PM and above:** end-to-end ownership, ambiguity, cross-team dependencies, mentoring.

**Group PM / Director and above:** product strategy, managing and coaching PMs, underperformance, hiring, org design, operating cadence, OKRs, cross-functional leadership, executive communication, budget.

**VP / CPO:** vision, portfolio bets, build/buy/partner, P&L and unit economics, pricing strategy, board and CEO communication, building the product org, culture, M&A integration, hiring and firing leaders, 30-60-90 day plan.

**Variant-specific:** AI PM (evals, spec-by-example, context and RAG, agents and guardrails, model routing, cost attribution, responsible AI and regulation), platform PM (APIs, developer experience, internal customers), growth PM (funnels, experiments, retention loops), B2B/enterprise (NRR, security reviews, customization vs roadmap, account churn), regulated domains (compliance by design).

**Company-specific (when a company is given):** at least 8–12 questions anchored to their products, customers, competitors, recent news and the JD's must-haves, e.g. "How would you improve [their product]?", "How would you compete with [named competitor]?", "What would you do in your first 90 days on [team from JD]?", "Our JD asks for X — tell me about a time you did X."

**Case exercises:** 3–6 full case walkthroughs suited to level and company.

## Step 5 — Write each question

Each entry has these fields:

- `q` — the question as the interviewer would say it.
- `s` — section id; `round` — which interview round it usually comes up in; `f` — `high` or `med` likelihood.
- `why` — one sentence: what signal the interviewer is looking for.
- `say` — **the answer as the candidate would speak it**: first person, plain, confident, 5–9 short sentences (case questions up to ~15, walking through the structure conversationally). Name one concrete example from the CV inside the answer where natural. Use everyday analogies for technical concepts.
- `ex` — **Your live example**, built from the candidate's CV:
  - `setup`: which CV item this uses and the situation, in 1–2 sentences.
  - `input`: the concrete starting point — the data, request, constraint, metric table, user complaint, code/tool call, or stakeholder ask.
  - `output`: the concrete result — the decision, artifact, numbers before/after. Use CV numbers; otherwise `[your number: …]` placeholders.
  - `how`: 2–4 sentences on where the concept or framework shows up in this example and why it matters to the interviewer.
- `best` — **Best possible outcome**: what the strongest version of this answer achieves — the result to aim for in the story (e.g. "shipped with a measurable lift and a reusable process") and the impression it should leave (e.g. "interviewer sees you pick one segment and tie it to revenue"). 2–3 sentences.
- `a` — key points in detail (bullets) for revision.
- `fu` — 2–4 likely follow-up questions.
- `g` — what a strong answer shows vs red flags.
- `r` — source ids.

For large sets, split writing across parallel subagents by section (4 agents of ~15–25 questions each is a good default). Give each agent the full CV extraction, the research brief, the level, the rules above, and the exact output format (JSON written with Python `json.dump(..., ensure_ascii=False)`). Then merge and check every entry has all fields and no invented CV facts.

## Step 6 — Company brief, plan, questions to ask

- **Company brief** (company-specific only): sections for What they do, Customers and business model, Products and recent launches, Technology and AI, Recent news, Competitors and positioning, Culture and values, What this role will be judged on (from JD), How to position yourself (3–5 bullets linking CV strengths to their needs), and Gaps to prepare for. Every fact links to a source. Include research date.
- **Prep plan:** sized to the timeline answer — daily plan with which sections to study, which stories to rehearse, and when to do mock interviews.
- **Questions to ask:** grouped by interviewer type (recruiter, hiring manager, peer PM, engineering lead, design, executive). Company-specific questions should reference real facts from the brief.

## Step 7 — Build and publish the web app

Before writing, follow the Artifact tool's publishing rules (run its quickstart for a plain page if required in this environment). Keep the design simple: the template below is the design. Write the data, fill the template, publish as a private artifact, and give the user the link in one sentence.

1. Write the data file defining these constants (JSON-compatible values):

```js
const META = {title:"<Company> PM Prep" /* or "PM Interview Prep" for general */, subtitle:"<Target role> · <years> yrs · <timeline>", key:"<short-slug>", note:"Researched <date>. Unreachable sources: …"};
const SOURCES = {id:["Title","https://…"], …};
const SECTIONS = [["Group label", [["sectionId","Section name"], …]], …];
const QA = [{s, round, f, q, why, say, ex:{setup,input,output,how}, best, a, fu, g, r:[…]}, …];
const BRIEF = [{h:"What they do", body:"markdown-lite"}, …];   // [] for general prep
const PLAN = [{h:"Week 1", body:"…"}, …];
const ASK = [{h:"Hiring manager", body:"- …"}, …];
```

Text fields use "markdown-lite": `**bold**`, lines starting with `- ` for bullets, `\n` line breaks, blank line for paragraphs, `[text](https://url)` links. No raw HTML.

2. Replace `__TITLE__` in the template with META.title and `/*DATA*/` with the data file contents. Save as `<slug>-prep.html` and publish with the Artifact tool (icon: `book`, one-sentence description). Take one render check (open it once, confirm no console errors and that a card expands) before publishing.

3. When updating later (new company info, more questions), republish to the same file path so the link stays the same.

### Template

```html
<title>__TITLE__</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@400;500;600&family=IBM+Plex+Mono:wght@400;500&display=swap">
<style>
:root{--bg:#f6f7f5;--surface:#fff;--ink:#1f2a2c;--muted:#5d6a68;--line:#dfe4e1;--accent:#1d6b5b;--accent-soft:#e3efeb;--warn:#8a5a12;--warn-soft:#f6ecd9;
--font:"IBM Plex Sans",system-ui,-apple-system,"Segoe UI",sans-serif;--mono:"IBM Plex Mono",ui-monospace,Menlo,Consolas,monospace}
@media (prefers-color-scheme:dark){:root:not([data-theme="light"]){--bg:#121716;--surface:#1a2120;--ink:#e3e9e7;--muted:#9aa7a4;--line:#2c3533;--accent:#72c5b0;--accent-soft:#1f302c;--warn:#e3b56a;--warn-soft:#33291a;color-scheme:dark}}
:root[data-theme="dark"]{--bg:#121716;--surface:#1a2120;--ink:#e3e9e7;--muted:#9aa7a4;--line:#2c3533;--accent:#72c5b0;--accent-soft:#1f302c;--warn:#e3b56a;--warn-soft:#33291a;color-scheme:dark}
*{box-sizing:border-box}
body{background:var(--bg);color:var(--ink);font:15px/1.6 var(--font);padding-inline:16px;padding-block:0 48px}
a{color:var(--accent)}
:focus-visible{outline:2px solid var(--accent);outline-offset:2px}
.wrap{max-width:1180px;margin:0 auto}
header.top{position:sticky;top:env(safe-area-inset-top,0px);z-index:5;background:var(--bg);border-bottom:1px solid var(--line);padding-block:12px}
.brand{display:flex;flex-wrap:wrap;align-items:baseline;gap:4px 14px}
.brand h1{font-size:19px;margin:0;font-weight:600}
.brand .sub{color:var(--muted);font-size:13px}
nav.tabs{display:flex;gap:6px;margin-top:10px;flex-wrap:wrap}
nav.tabs button{font:500 14px var(--font);background:transparent;color:var(--muted);border:1px solid var(--line);border-radius:6px;padding:6px 12px;cursor:pointer}
nav.tabs button[aria-selected="true"]{background:var(--ink);color:var(--bg);border-color:var(--ink)}
.layout{display:grid;grid-template-columns:240px 1fr;gap:28px;margin-top:20px}
@media (max-width:820px){.layout{grid-template-columns:1fr}}
aside.sections{position:sticky;top:120px;align-self:start;max-height:calc(100vh - 140px);overflow:auto}
@media (max-width:820px){aside.sections{position:static;max-height:none}aside.sections .list{display:flex;flex-wrap:wrap;gap:6px}aside.sections button{width:auto!important;border:1px solid var(--line)!important;gap:6px}.group-label{width:100%}}
.group-label{font:500 11px var(--mono);text-transform:uppercase;letter-spacing:.08em;color:var(--muted);margin:14px 0 4px}
aside.sections button{display:flex;justify-content:space-between;width:100%;text-align:left;font:14px var(--font);color:var(--ink);background:none;border:0;border-radius:5px;padding:4px 8px;cursor:pointer}
aside.sections button:hover,aside.sections button.on{background:var(--accent-soft)}
aside.sections button.on{color:var(--accent);font-weight:600}
aside.sections .n{font:12px var(--mono);color:var(--muted)}
.controls{display:flex;flex-wrap:wrap;gap:10px 16px;align-items:center;margin-bottom:16px}
.controls input[type=search]{flex:1 1 240px;font:15px var(--font);padding:8px 10px;border:1px solid var(--line);border-radius:6px;background:var(--surface);color:var(--ink)}
.controls label{font-size:14px;color:var(--muted);display:flex;gap:6px;align-items:center;cursor:pointer}
.btn{font:13px var(--font);background:none;border:1px solid var(--line);color:var(--ink);border-radius:5px;padding:5px 10px;cursor:pointer}
.progress{font:13px var(--mono);color:var(--muted)}
.sec-title{font-size:17px;font-weight:600;margin:26px 0 8px;padding-bottom:6px;border-bottom:1px solid var(--line)}
details.qa{background:var(--surface);border:1px solid var(--line);border-radius:8px;margin-bottom:8px}
details.qa>summary{list-style:none;cursor:pointer;padding:12px 14px;display:flex;gap:10px;align-items:flex-start}
details.qa>summary::-webkit-details-marker{display:none}
.chev{flex:none;width:14px;color:var(--muted);margin-top:4px;transition:transform .15s}
details.qa[open]>summary .chev{transform:rotate(90deg)}
@media (prefers-reduced-motion:reduce){.chev{transition:none}}
.qtext{flex:1;font-weight:500}
details.qa.done .qtext{color:var(--muted)}
.tags{display:flex;gap:6px;flex:none;flex-wrap:wrap;justify-content:flex-end}
.tag{font:11px var(--mono);padding:1px 6px;border-radius:4px;border:1px solid var(--line);color:var(--muted);white-space:nowrap}
.tag.high{background:var(--warn-soft);color:var(--warn);border-color:transparent}
.ans{padding:0 16px 14px 38px;max-width:86ch}
@media (max-width:640px){.ans{padding-left:16px}}
.ans p{margin:6px 0}.ans ul{margin:6px 0;padding-left:20px}.ans li{margin:3px 0}
.lbl{font:500 11px var(--mono);text-transform:uppercase;letter-spacing:.07em;color:var(--muted);display:block;margin-bottom:2px}
.why{font-size:14px;color:var(--muted);margin:4px 0 10px}
.say{border-left:3px solid var(--accent);padding:4px 0 4px 14px;margin:8px 0 14px}
.say .lbl,.ex>.lbl{color:var(--accent)}
.say p{font-size:15.5px}
.ex{border:1px solid var(--line);border-radius:8px;padding:12px 14px;margin:0 0 14px}
.io{display:grid;grid-template-columns:1fr 1fr;gap:10px}
@media (max-width:640px){.io{grid-template-columns:1fr}}
.io>div,.how{background:var(--bg);border-radius:6px;padding:8px 10px;font-size:14px;min-width:0;overflow-wrap:anywhere}
.how{margin-top:10px}
.best{background:var(--accent-soft);border-radius:6px;padding:10px 12px;margin:0 0 14px;font-size:14px}
.best .lbl{color:var(--accent)}
details.more>summary{cursor:pointer;padding:4px 0}
.box{margin-top:10px;font-size:14px}
.srcs{margin-top:10px;font-size:13.5px}
.rowfoot{display:flex;justify-content:flex-end;margin-top:10px}
.rowfoot label{font-size:13px;color:var(--muted);display:flex;gap:6px;align-items:center;cursor:pointer}
.reveal{display:none}
body.quiz details.qa[open] .reveal{display:inline-block}
body.quiz .body.hidden{display:none}
.doc{max-width:80ch;margin-top:20px}
.doc h2{font-size:18px;margin:28px 0 8px}
.doc h2:first-child{margin-top:0}
.note{font-size:13px;color:var(--muted)}
.empty{color:var(--muted);padding:20px 0}
</style>

<header class="top"><div class="wrap">
  <div class="brand"><h1 id="t"></h1><span class="sub" id="sub"></span></div>
  <nav class="tabs" role="tablist" id="tabs"></nav>
</div></header>
<main class="wrap">
  <section id="view-qa"><div class="layout">
    <aside class="sections" id="secnav" aria-label="Sections"></aside>
    <div>
      <div class="controls">
        <input type="search" id="q" placeholder="Search questions, answers and examples">
        <label><input type="checkbox" id="hi"> Most likely only</label>
        <label><input type="checkbox" id="quiz"> Quiz mode</label>
        <label><input type="checkbox" id="hidedone"> Hide reviewed</label>
        <button class="btn" id="expand">Expand all</button>
        <span class="progress" id="prog"></span>
      </div>
      <div id="list"></div>
    </div>
  </div></section>
  <section id="view-brief" hidden><div class="doc" id="brief"></div></section>
  <section id="view-plan" hidden><div class="doc" id="plan"></div></section>
  <section id="view-ask" hidden><div class="doc" id="ask"></div></section>
  <section id="view-src" hidden><div class="doc" id="src"></div></section>
</main>

<script>
/*DATA*/
</script>
<script>
(function(){
const $=id=>document.getElementById(id);
function esc(s){return String(s??"").replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;");}
function inline(s){return esc(s).replace(/\*\*(.+?)\*\*/g,"<strong>$1</strong>").replace(/\[(.+?)\]\((https?:\/\/[^\s)]+)\)/g,'<a href="$2" target="_blank" rel="noopener">$1</a>');}
function md(t){return String(t??"").trim().split(/\n\s*\n/).map(b=>{let o="",ul=[],tx=[];
  const fu=()=>{if(ul.length){o+="<ul>"+ul.map(l=>"<li>"+inline(l)+"</li>").join("")+"</ul>";ul=[];}};
  const ft=()=>{if(tx.length){o+="<p>"+tx.map(inline).join("<br>")+"</p>";tx=[];}};
  b.split("\n").forEach(l=>{if(/^\s*- /.test(l)){ft();ul.push(l.replace(/^\s*- /,""));}else{fu();tx.push(l);}});ft();fu();return o;}).join("");}
function docHTML(arr){return (arr||[]).map(x=>"<h2>"+esc(x.h)+"</h2>"+md(x.body)).join("");}

$("t").textContent=META.title; $("sub").textContent=META.subtitle||"";
const views=[["qa","Questions & answers"]];
if(BRIEF&&BRIEF.length) views.unshift(["brief","Company brief"]);
views.push(["plan","Prep plan"]); if(ASK&&ASK.length) views.push(["ask","Questions to ask"]); views.push(["src","Sources"]);
$("tabs").innerHTML=views.map(v=>'<button role="tab" data-view="'+v[0]+'" aria-selected="'+(v[0]==="qa")+'">'+v[1]+'</button>').join("");
$("tabs").addEventListener("click",e=>{const b=e.target.closest("button");if(!b)return;
  $("tabs").querySelectorAll("button").forEach(x=>x.setAttribute("aria-selected",x===b));
  ["qa","brief","plan","ask","src"].forEach(v=>$("view-"+v).hidden=v!==b.dataset.view);window.scrollTo({top:0});});
$("brief").innerHTML=docHTML(BRIEF); $("plan").innerHTML=docHTML(PLAN); $("ask").innerHTML=docHTML(ASK);
$("src").innerHTML="<h2>Sources</h2><ul>"+Object.keys(SOURCES).map(k=>'<li><a href="'+esc(SOURCES[k][1])+'" target="_blank" rel="noopener">'+esc(SOURCES[k][0])+"</a></li>").join("")+"</ul>"+(META.note?'<p class="note">'+esc(META.note)+"</p>":"");

const ALL=QA.map((x,i)=>Object.assign({id:"q"+i},x));
const secName={}; SECTIONS.forEach(g=>g[1].forEach(s=>secName[s[0]]=s[1]));
const KEY="prep-"+(META.key||"x");
let done={}; try{done=JSON.parse(localStorage.getItem(KEY)||"{}")||{};}catch(e){done={};}
const save=()=>{try{localStorage.setItem(KEY,JSON.stringify(done));}catch(e){}};
let current="all";
let nav='<div class="list"><button data-s="all" class="on"><span>All sections</span><span class="n">'+ALL.length+'</span></button></div>';
SECTIONS.forEach(g=>{nav+='<div class="group-label">'+esc(g[0])+'</div><div class="list">';g[1].forEach(s=>{const n=ALL.filter(x=>x.s===s[0]).length;if(n)nav+='<button data-s="'+s[0]+'"><span>'+esc(s[1])+'</span><span class="n">'+n+'</span></button>';});nav+='</div>';});
$("secnav").innerHTML=nav;
$("secnav").addEventListener("click",e=>{const b=e.target.closest("button");if(!b)return;current=b.dataset.s;$("secnav").querySelectorAll("button").forEach(x=>x.classList.toggle("on",x===b));render();window.scrollTo({top:0});});

function card(x){
  const e=x.ex||{};
  const srcs=(x.r||[]).filter(k=>SOURCES[k]).map(k=>'<li><a href="'+esc(SOURCES[k][1])+'" target="_blank" rel="noopener">'+esc(SOURCES[k][0])+'</a></li>').join("");
  return '<details class="qa'+(done[x.id]?' done':'')+'"><summary><svg class="chev" viewBox="0 0 10 10" aria-hidden="true"><path d="M3 1l4 4-4 4" fill="none" stroke="currentColor" stroke-width="1.6"/></svg><span class="qtext">'+esc(x.q)+'</span><span class="tags">'+(x.f==="high"?'<span class="tag high">likely</span>':'')+(x.round?'<span class="tag">'+esc(x.round)+'</span>':'')+'</span></summary>'+
  '<div class="ans"><button class="btn reveal">Show answer</button><div class="body hidden">'+
  (x.why?'<p class="why"><strong>Why they ask:</strong> '+inline(x.why)+'</p>':'')+
  '<div class="say"><span class="lbl">Say it like this</span>'+md(x.say)+'</div>'+
  (e.setup?'<div class="ex"><span class="lbl">Your live example</span>'+md(e.setup)+'<div class="io"><div><span class="lbl">Input</span>'+md(e.input)+'</div><div><span class="lbl">Output</span>'+md(e.output)+'</div></div><div class="how"><span class="lbl">How the concept shows up</span>'+md(e.how)+'</div></div>':'')+
  (x.best?'<div class="best"><span class="lbl">Best possible outcome</span>'+md(x.best)+'</div>':'')+
  (x.a?'<details class="more"><summary class="lbl">+ Key points in detail</summary>'+md(x.a)+'</details>':'')+
  (x.fu?'<div class="box"><span class="lbl">Likely follow-ups</span>'+md(x.fu)+'</div>':'')+
  (x.g?'<div class="box"><span class="lbl">Strong answer vs red flags</span>'+md(x.g)+'</div>':'')+
  (srcs?'<div class="srcs"><span class="lbl">Read more</span><ul>'+srcs+'</ul></div>':'')+
  '</div><div class="rowfoot"><label><input type="checkbox" class="mark" data-id="'+x.id+'"'+(done[x.id]?' checked':'')+'> Reviewed</label></div></div></details>';
}
function prog(){$("prog").textContent=Object.values(done).filter(Boolean).length+" / "+ALL.length+" reviewed";}
function render(){
  const t=$("q").value.trim().toLowerCase(),hi=$("hi").checked,hide=$("hidedone").checked;
  const items=ALL.filter(x=>(current==="all"||x.s===current)&&(!hi||x.f==="high")&&(!hide||!done[x.id])&&(!t||JSON.stringify(x).toLowerCase().includes(t)));
  let h="",last=null; items.forEach(x=>{if(x.s!==last){h+='<h2 class="sec-title">'+esc(secName[x.s]||x.s)+'</h2>';last=x.s;}h+=card(x);});
  $("list").innerHTML=h||'<p class="empty">No questions match. Clear the search or filters.</p>'; prog();
}
document.addEventListener("click",e=>{if(e.target.classList.contains("reveal")){e.target.nextElementSibling.classList.remove("hidden");e.target.remove();}});
$("list").addEventListener("change",e=>{if(!e.target.classList.contains("mark"))return;done[e.target.dataset.id]=e.target.checked;save();e.target.closest("details.qa").classList.toggle("done",e.target.checked);prog();});
["q","hi","hidedone"].forEach(id=>$(id).addEventListener("input",render));
$("quiz").addEventListener("change",()=>{document.body.classList.toggle("quiz",$("quiz").checked);render();});
let ex=false; $("expand").addEventListener("click",()=>{ex=!ex;document.querySelectorAll("details.qa").forEach(d=>d.open=ex);$("expand").textContent=ex?"Collapse all":"Expand all";});
render();
})();
</script>
```

## Step 8 — Offer the mock interview

After publishing, reply in 2–3 sentences: what was built, any research gaps, and offer a live mock interview. If they accept:

- Ask which rounds to practise (or run a mixed loop), and whether to simulate a specific interviewer type (hiring manager, engineering lead, executive).
- Play the interviewer. Ask **one question at a time** and wait for the answer. Ask one realistic follow-up when the answer is thin, like a real interviewer would.
- After each answer, give brief feedback: score 1–4 on structure, specificity (numbers, concrete example), judgment/trade-offs, and level-appropriateness; one thing that worked; one thing to fix; then a tightened version of their answer in their own voice using their real facts.
- Keep a running tally. After 5–8 questions or when they stop, summarize: strongest areas, top 3 fixes, which questions to re-practise, and offer to add any new questions or improved answers to the web app (republish to the same link).
- Never coach them to claim experience they do not have; when a gap shows, help them frame adjacent experience honestly.