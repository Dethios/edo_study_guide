# October 2026 PDF Layout and ASN(RD&A) Review

Current as of 2026-10-20.

## Visual Review

Reviewed all 95 table-bearing pages of the 474-page release PDF using 16 rendered contact sheets,
then inspected full-size pages for malformed T&E tables, appropriation overflow, and diagram label collisions.
Page references below are one-based PDF page indices in the October 19 baseline, including front matter.

| Baseline PDF Pages | Finding                                                                              | Correction                                                                           |
| ------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| 260-269            | Two literal `DOT&E` ampersands created unintended columns and extreme word wrapping. | Escape both literal ampersands; retain intended six- and four-column specifications. |
| 100                | Appropriation descriptions extended beyond the right page edge.                      | Use a wrapping description column.                                                   |
| 93, 103            | Compact natural-width tables squeezed long captions and source notes.                | Expand tables with flexible columns.                                                 |
| 178-179, 270-271   | Tables began with a single body row before a page break.                             | Reserve space before the heading and table start.                                    |
| 253                | T&E governance labels overlapped nodes and exceeded the page edge.                   | Align nodes in two lanes; use numbered arrows and a separate readable legend.        |
| Front matter       | Long Roman table numbers crowded entry text.                                         | Widen the list-of-tables number field.                                               |

The flag-roster headings now explicitly identify the June snapshot, with a separate October ASN(RD&A) note.
The narrow rank column in the dated flag roster was also widened slightly to accommodate `RADM(sel)`
without a small overfull box; the roster facts and snapshot date are preserved.

## ASN(RD&A) Verification

- Original claim: William F. Mahan is the current PTDO ASN(RD&A).
- Verdict: **Outdated**.
- Corrected answer: VADM Elizabeth Seiko Okano performs ASN(RD&A) duties following the September 29 transition
  of Mahan to Under Secretary duties.
- Confidence: **Medium**, reflecting direct-source retrieval limits, rather than uncertainty about the
  consistent named transition reporting.
- Scope: update the chapter, organization diagram, leadership table, PAE appendix, and current-events cue.
  Preserve the separate June flag roster as a historical snapshot. The May deputy roster is dated;
  no independently verified October replacement deputy roster is asserted.

Source basis:

1. [September 30 ExecutiveGov transition report](https://www.executivegov.com/articles/william-mahan-navy-under-secretary-ptdo-appointment),
   read directly, identifies both the Mahan move and Okano assuming ASN(RD&A) responsibilities.
2. [Official Navy CIO memorandum](https://www.doncio.navy.mil/ContentView.aspx?ID=20538), indexed official text,
   identifies E. S. Okano as performing ASN(RD&A) duties in its signature block. Direct retrieval returned an error;
   the indexed signature corroborates the report, without establishing an independently retrieved memorandum date.
3. The report links the Navy's September 29 release (article 4614226). Its body was blocked during retrieval;
   this review does not claim to have read the complete primary announcement.

## Validation

The native LuaLaTeX/Biber build is used because this environment cannot access the Docker daemon.
Source checks pass for acronym hygiene, TeX structure, study memory, current-events and guide-change source ledgers,
cited-URL coverage, TikZ cache boundaries, Markdown, and whitespace.

The T&E tables now have consistent delimiters across all rows: six columns in the ACAT table and four in the players
table. Keep the final two players together to avoid a lone last row on a continuation page.

The converged content has 467 pages, compared with 474 in the baseline. Re-inspected all 89 table-bearing pages
in 15 rendered contact sheets, and checked corrected tables and the T&E diagram at full-page size.
The page count reduction comes chiefly from restoring the intended T&E columns.

Verified rendered destinations: ASN leadership table (PDF 17), funding policy (93), appropriation subdivisions (99),
cost methods (103), cross-milestone comparison (178), T&E diagram (252), ACAT differences (259-260),
players (260-262), board traps (263-264), and the dated flag table (390-391).

Final build completed successfully after four LuaLaTeX passes. There are zero overfull boxes (baseline: 86),
zero undefined citations or references, zero missing characters, and zero `[0]` citation placeholders.
Three pre-existing font fallback warnings remain for Latin Modern Sans small caps and the associated summary.
No text extends outside the checked page safety bounds.

The final pass changed text positions only on front-matter pages 3, 4, 6, 8, and 9 as references settled;
those pages were re-inspected. All table-page text positions match the visually reviewed pass exactly.

PDF SHA-256: `2de60894d43a71f1c58a19738896b124bcabd84f264bb1a86b44eeaa23c21538`.
The broader source audit still reports older access dates on existing references; this task does not
represent a fresh live verification of every reference in the guide.
