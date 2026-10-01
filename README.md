# Blog Comments Automation Skill 💬🔗

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Category](https://img.shields.io/badge/Category-Local%20SEO%20%26%20Link%20Building-orange.svg)]()
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey.svg)]()

> A standalone production skill for high-impact, contextual Blogspot/Blogger blog commenting, intelligent post analysis, natural contextual backlinking, and Google Sheets campaign management.

---

## 🌟 Overview

**Blog Comments** is an automated standard operating procedure and tool suite developed for Local SEO campaigns. It allows AI agents and operators to:
1. Harvest organic ranking Blogspot opportunities using specialized search footprints.
2. Read and analyze full post content before crafting responses.
3. Generate natural, human-written, value-adding comments that respect forum rules.
4. Seamlessly integrate bold contextual anchor backlinks:
   ```html
   <b><a href="https://yourwebsite.com/">Relevant Anchor Text</a></b>
   ```
5. Automate submission within dedicated Chrome profiles without interrupting the user's active workstation.
6. Manage link tracking in Google Sheets with 8-week allocation matrixes and yellow divider tracking rules.

---

## 📁 Repository Structure

```text
blog-comments/
├── SKILL.md                 # Antigravity skill specification and procedure runbook
├── manifest.json            # Skill packaging metadata and CLI commands
├── README.md                # Full documentation and usage guide
├── LICENSE                  # MIT License
├── .gitignore               # Ignored cache & temporary files
├── scripts/
│   ├── search_blogs.py      # Organic Blogspot footprint harvester
│   ├── craft_comment.py     # Content scraper & contextual comment drafter
│   ├── blogger_submit.ps1   # Win32 desktop automation for Blogger iframe
│   └── sheet_logger.ps1     # Google Sheets yellow divider & URL logger
└── references/
    ├── comment_templates_and_anchors.md  # Copywriting & anchor variations
    ├── sheet_structure_guide.md          # 8-week matrix & overflow protocols
    └── desktop_automation_guide.md       # Windows multi-monitor sandbox guide
```

---

## 🚀 Installation

### Global Antigravity Installation
Clone or copy this repository into your global Antigravity skills directory:

```bash
git clone https://github.com/seogeoteam/Blog-Comments.git ~/.gemini/config/skills/blog-comments
```

Once placed in `~/.gemini/config/skills/blog-comments`, Antigravity IDE and CLI will automatically discover and load the skill on demand.

---

## 🛠️ Usage Workflow

### 1. Harvest Blog Opportunities
```bash
python scripts/search_blogs.py "basement waterproofing service" 10
```

### 2. Draft Contextual Human Comment with Bold Backlink
```bash
python scripts/craft_comment.py "https://example.blogspot.com/2026/07/post.html" "https://yourwebsite.com/" "professional basement waterproofing solutions"
```

### 3. Google Sheets Campaign Tracking
The tracking sheet organizes links across:
- **Weeks 1 to 8:** 10 numbered rows per week in Column E.
- **Extra Links:** Positioned below Week 8.
- **The Yellow Divider Rule:** When adding a new batch of extra links, mark the row immediately after the prior batch with **Yellow** background, then log new URLs in Column E starting from the row beneath.

---

## 📄 License
This project is licensed under the [MIT License](LICENSE).
