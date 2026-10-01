---
name: blog-comments
description: Comprehensive automation and standard operating procedure for niche-relevant Blogspot/Blogger blog commenting for local SEO and link building, including post analysis, human-written contextual comments, bold contextual anchor backlinks, multi-profile Chrome session routing, and Google Sheets weekly logging with yellow divider tracking.
---

# Blog Comments (Local SEO & Contextual Link Building)

A production-grade skill for executing high-quality, niche-relevant Blogspot/Blogger commenting campaigns for local SEO. This skill covers the full lifecycle: identifying ranking blog opportunities, extracting and analyzing post content, generating value-adding human comments, embedding bold contextual anchor backlinks (`<b><a href="...">...</a></b>`), safely publishing via dedicated Chrome profiles without interrupting active user workflows, and tracking all published links in a Google Sheets tracking matrix (Weeks 1–8 and extra overflow with yellow divider rows).

---

## Key Capabilities & Workflow Architecture

```
[Phase 1: Search & Harvesting]
Google: "blogspot" + "<niche/service>" -> Extract organic blogspot URLs

[Phase 2: In-Depth Post Reading & Context Analysis]
Fetch post body -> Analyze subject matter -> Synthesize key insights

[Phase 3: Human-Written Comment & Contextual Anchor]
Draft unique, thoughtful response + Bold contextual backlink:
<b><a href="<target_url>"><Relevant Anchor Text></a></b>

[Phase 4: Visible Desktop Publishing via Dedicated Chrome Profile]
Target Chrome Profile (e.g. Profile 69) -> Visible desktop session
Locate Blogger comment iframe -> Enter comment -> Click PUBLISH

[Phase 5: Publication Verification]
Verify live comment display or moderation notice -> Copy exact post URL

[Phase 6: Google Sheets Tracking & Weekly Allocation Matrix]
Open Client Tracking Sheet -> Navigate to "blog comment" tab
Check Weeks 1–8 (10 rows/week) -> Fill open week slots sequentially
If Weeks 1–8 filled -> Locate end of extra links (e.g. Row 46)
Color next row YELLOW -> Paste new URL into Column E of subsequent row
```

---

## Operating Protocols & Golden Rules

### 1. Zero Interruption Rule (Multi-Monitor & Multi-Window Safety)
- **NEVER** close, minimize, or overwrite existing user browser windows, tabs, or desktop applications.
- Run dedicated client tasks inside that client's specific Chrome profile (e.g., mapped from `%LOCALAPPDATA%\Google\Chrome\User Data\Local State`).
- On Windows multi-monitor setups, place automation windows on secondary displays (e.g. Display 2) snapped cleanly to maintain visible execution without disrupting the user's primary monitor.

### 2. Comment Quality & Anti-Spam Standards
- Every comment must read like an authentic, observant industry professional or local homeowner.
- **NEVER** post generic praise (e.g., *"Nice post, thanks for sharing"* or *"Very informative article"*).
- The comment must directly reference specific points, recommendations, or solutions discussed in the blog post.
- Backlink formatting is strictly:
  ```html
  <b><a href="https://yourwebsite.com/">Contextually Relevant Anchor Text</a></b>
  ```
  *Note:* The anchor text must match the subject matter of the blog post and fit seamlessly into the sentence flow.

### 3. Google Sheets Tracking Protocol ("blog comment" sheet)
- The tracking sheet must maintain the client's weekly distribution:
  - **Weeks 1 to 8:** Each week has a dedicated section of 10 numbered rows.
  - **Sequential Checking:** Always inspect Column E from Week 1 through Week 8 first. If any week has empty slots, populate them sequentially (10 links per week) before moving to subsequent weeks.
  - **Overflow / Extra Links:** If Weeks 1 to 8 are already 100% full (all 80 slots occupied), extra links are recorded below Week 8 in Column E.
  - **The Yellow Divider Rule:**
    - Identify the last populated row in the extra links section (e.g., Row 46 of extra links).
    - Color the immediately following empty row completely **Yellow** (`#FFFF00`) as a visual batch divider.
    - Insert the new published blog URL into **Column E** of the row directly below the yellow divider row.
    - Confirm the sheet has saved to Google Drive.

---

## Step-by-Step Procedure

### Phase 1: Opportunity Discovery
1. Identify the target business niche, core service, and geographical market (e.g., `basement waterproofing service`, Hanover).
2. Query Google Search with the exact footprint:
   ```
   "blogspot" + "<service keyword>"
   ```
3. Filter search results:
   - Identify organic organic results ending with `.blogspot.com`.
   - Skip sponsored ads, aggregators, Pinterest boards, or unrelated social pages.
   - Open target post in a new tab.

### Phase 2: Content Parsing & Analysis
1. Read the blog post completely from headline down to the comment form.
2. Extract:
   - Central theme (e.g., seasonal water intrusion, foundation cracks, sump pump maintenance).
   - Practical tips or methodologies highlighted by the author.
   - Target audience pain points.

### Phase 3: Crafting Contextual Comment & Backlink
1. Formulate a 2–4 sentence thoughtful response:
   - Sentence 1: Validate a specific observation or tip from the article.
   - Sentence 2: Expand with practical expertise, preventative maintenance context, or regional considerations.
   - Sentence 3: Contextually integrate the client's backlink using bold anchor formatting:
     ```html
     <b><a href="https://hanoverbasementwaterproofing.com/">professional basement waterproofing solutions</a></b>
     ```
2. Verify HTML validity: ensure tags are properly closed (`<b><a href="...">...</a></b>`) without malformed quotation marks or syntax errors.

### Phase 4: Publishing via Blogger Iframe
1. Focus the active client Chrome window.
2. Scroll to the comments section at the bottom of the blog post.
3. Locate the Blogger comment iframe (name/id typically contains `comment-editor` or `comments`).
4. Select identity (e.g., logged-in Google Account / Author profile).
5. Type or paste the prepared comment into the comment textarea.
6. Click the blue **PUBLISH** button.
   - *Technical Note:* In automated environments using Win32 API / Task Scheduler, use explicit mouse down/up with zero movement delta (`MOUSEEVENTF_LEFTDOWN = 0x0002` with `dx=0, dy=0`) after positioning cursor via `SetCursorPos`.

### Phase 5: Verification
1. Inspect the page to confirm publication:
   - Check if comment appears under the live comments list under the user's name.
   - If moderation is enabled, confirm the confirmation banner (*"Your comment will be visible after approval"*).
2. Copy the exact canonical blog post URL.

### Phase 6: Sheet Logging & Yellow Divider Implementation
1. Switch to the client's Google Sheet (from bookmarks or direct URL).
2. Switch to the bottom worksheet tab named **"blog comment"**.
3. Evaluate Column E:
   - If Weeks 1–8 have vacant rows, fill the earliest incomplete week until it has 10 links, then proceed sequentially.
   - If Weeks 1–8 are complete, scroll down to the extra links list below the weekly blocks.
   - Locate the last populated row (e.g., 46th extra link).
   - Select the row header of the next empty row.
   - Apply background fill color: **Yellow** (`#FFFF00`).
   - Select **Column E** on the row immediately beneath the yellow divider row.
   - Paste the copied blog post URL.
   - Press Enter and confirm Google Sheets status displays "Saved to Drive".

---

## Technical Helpers & Scripts

The skill provides ready-to-use scripts located in the `scripts/` directory:

| Script | Purpose | Usage |
| :--- | :--- | :--- |
| `scripts/search_blogs.py` | Organic Blogspot search query harvester | `python scripts/search_blogs.py "<service_query>"` |
| `scripts/craft_comment.py` | Extracts post text and crafts contextual comment with bold anchor | `python scripts/craft_comment.py <post_url> <target_site_url> "<niche>"` |
| `scripts/blogger_submit.ps1` | Interactive desktop automation for Blogger iframe submission | `powershell -ExecutionPolicy Bypass -File scripts/blogger_submit.ps1` |
| `scripts/sheet_logger.ps1` | Automates Google Sheets navigation, yellow divider, and Column E link insertion | `powershell -ExecutionPolicy Bypass -File scripts/sheet_logger.ps1` |

---

## Windows Automation Architecture Notes

When operating in restricted agent environments (such as sandboxed terminal sessions or IDE sub-processes):
- Standard terminal sessions on Windows often reside in non-interactive session containers (Job Objects) where GUI automation (`user32.dll` `SetForegroundWindow`, `SetCursorPos`, `mouse_event`) is restricted.
- **Solution:** Execute desktop-level automation via Windows Task Scheduler (`schtasks /run /tn "..."`) configured for the interactive user desktop (`/it`).
- **Mouse Coordinate Delts:** Always pass `0, 0` for `dx, dy` in `mouse_event` after calling `SetCursorPos(X, Y)` to prevent Windows from applying unintended relative offset deltas.
