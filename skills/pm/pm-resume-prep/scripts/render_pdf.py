"""Render a resume HTML file to an A4 PDF and run layout checks.

Usage: python3 render_pdf.py /abs/path/resume.html /abs/path/resume.pdf
Needs: playwright (Chromium) and pdfplumber.
"""
import re, sys, pdfplumber
from playwright.sync_api import sync_playwright

src, out = sys.argv[1], sys.argv[2]
html = open(src, encoding="utf-8").read()
body = re.sub(r"<!--.*?-->|<style.*?</style>", "", html, flags=re.S)

warnings = []
if 'class="fill"' in body:
    warnings.append('placeholder spans (class="fill") still present')
if re.search(r"\[[^\]]*\]", re.sub(r"<[^>]+>", "", body)):
    warnings.append("bracketed [placeholder] text still present")
if re.search("[–—]|&mdash;|&ndash;", body):
    warnings.append("em or en dash found; use a comma, colon or plain hyphen")

with sync_playwright() as p:
    b = p.chromium.launch(); pg = b.new_page()
    pg.goto("file://" + src); pg.emulate_media(media="print")
    pg.pdf(path=out, format="A4", prefer_css_page_size=True, print_background=True)
    b.close()

with pdfplumber.open(out) as pdf:
    n = len(pdf.pages); print("PAGES:", n)
    for i, page in enumerate(pdf.pages, 1):
        lines = (page.extract_text() or "").splitlines()
        print(f"p{i} starts: {lines[0][:70] if lines else ''} | ends: {lines[-1][:70] if lines else ''}")

if n > 3:
    warnings.append("over 3 pages; trim")
for w in warnings:
    print("WARNING:", w)
print("OK" if not warnings else "FIX AND RE-RENDER")
