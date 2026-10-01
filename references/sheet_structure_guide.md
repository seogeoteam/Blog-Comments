# Google Sheets Tracking Architecture Guide ("blog comment" Sheet)

## 1. Sheet Layout & Column Mapping
The tracking sheet organizes links across scheduled campaign weeks and overflow batches.

- **Target Worksheet Tab:** Always use the sub-tab labeled `"blog comment"`.
- **Primary Data Column:** **Column E** contains the live blog post URLs where comments were published.

---

## 2. Weekly Allocation Rules (Weeks 1 to 8)
- Each week (1st week, 2nd week, ... 8th week) has an allocated block of **10 numbered rows**.
- **Inspection Step:** Before logging any new link, the agent must check Column E starting at Week 1.
- **Filling Sequential Order:**
  - If Week 1 has fewer than 10 links, fill Week 1 first.
  - Once Week 1 reaches 10 links, move to Week 2.
  - Repeat through Week 8 (Total capacity: 80 scheduled weekly links).

---

## 3. Extra Links & The Yellow Divider Rule
- If Weeks 1 through 8 are already 100% full, new links are placed below the weekly blocks in the extra links area.
- In existing sheets, extra links continue sequentially down Column E (e.g. 46 existing links).
- **The Yellow Divider Protocol:**
  1. Determine the end of the existing batch (e.g. Row 137).
  2. Select the row immediately below the last link (e.g. Row 138).
  3. Apply background color: **Yellow** (`#FFFF00`).
  4. Move down to the next row (e.g. Row 139) in **Column E**.
  5. Paste the new published blog post URL.
  6. Confirm that the status icon displays "Saved to Drive".

---

## 4. Visual Layout Diagram

```text
Row 1..80   : [Weeks 1 to 8] (10 links per week)
...
Row 90..137 : [Extra Blogspot Links 1 to 46 in Column E]
Row 138     : [================ YELLOW DIVIDER ROW ================]
Row 139     : Column E -> [New Published Blogspot URL #1]
Row 140     : Column E -> [New Published Blogspot URL #2]
...
```
