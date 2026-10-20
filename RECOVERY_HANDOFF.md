# Incomplete recovery snapshot

This branch preserves interrupted work. **It is not a validated study-guide update or release.**
Do not publish the existing PDF as the result of this audit.

- Repository: <https://github.com/Dethios/edo_study_guide>
- Recovery branch: `recovery/edo-source-update-20261020T162032Z`
- Starting HEAD: `e8b2ef1a10271b1e6e64bb717a70b1707b57b11e`
- Recovery date: 2026-10-20
- Instructions: read `AGENTS.md` and this file before editing.

## Verified saved state

The original branch was `work`. Its index was empty; ten chapter files had unstaged edits.
All six research workers ended with stream errors. No TeX, Biber, Python, or PDF-rendering process was active
at the recovery check. No workers were restarted. No reset, clean, permission change, or full build was run.

All 71 retained coursebooks are already tracked; their SHA-256 values match the saved inventory
(2,805 pages). The earlier October refresh and acquisition-policy commits remain intact.

Ten chapter edits survived: contracting fundamentals; solicitation; source selection; source-selection practical;
contract administration; cost/price evaluation; PPBE; congressional enactment; program funding/execution; and
the JFRP chapter retained under filename `17K_jcids.tex`. These include revised exchanges and data-rights teaching,
PPBE organizational crosswalks, budget definitions, MYP qualifications, and a Service requirements-approval cue.
They are **partially integrated and unvalidated**; inspect the diff against the starting HEAD.

Saved module review records exist for 29 of 71 modules. These are the interrupted reviewers' records, not a fresh
independent certification of their findings. Rendering a contact sheet alone does not establish review completion.
No changes to the requested figures or leadership tables survived. No new figure asset was created.
Engineering, leadership/legal, and maintenance findings remain research proposals in the saved reports.

## Checkpoint, coverage, and source evidence

- `docs/reference/2026-10-comprehensive-audit/checkpoint.md`: overall scope and continuation checkpoint.
- `docs/reference/2026-10-comprehensive-audit/task-request.md`: full original requirements for the replacement task.
- `docs/reference/2026-10-comprehensive-audit/recovery-state.json`: actual saved file hashes, all 71 modules,
  links to surviving review records, and unresolved bibliography keys.
- `docs/reference/2026-10-comprehensive-audit/inventory.json`: source paths, editions, dates, page counts, hashes.
- `docs/reference/2026-10-comprehensive-audit/batches/`: detailed page/topic mappings, findings, official URLs,
  source/effective dates, access limits, and implementation notes. Later implementation notes may supersede
  earlier "research only" text within the same report; actual source diffs are controlling evidence of edits.
- `docs/reference/coursebook-coverage-manifest.yaml`: prior TLO-to-chapter mapping. Its older coverage statuses
  do not certify completion of this audit.
- `docs/superpowers/plans/2026-10-20-comprehensive-coursebook-audit.md`: original execution outline.
- `docs/reference/2026-10-{coursebook-refresh,acquisition-policy-audit,toc-roster-refresh}.md` and
  `docs/study_memory/`: previous completed work and source provenance.

No `organizations*` report survived in `batches/`; do not reconstruct it from assumed completion.
No `contracts-new.bib`, `engineering-new.bib`, `leadership-new.bib`, or `maintenance_civpers-new.bib` was saved.
Only `requirements-new.bib` exists, containing the unmerged GAO budget glossary entry.
The Naval Justice PDF's edition remains uncertain: the saved legal report distinguishes the embedded title's
October 2025 date from the March 2026 file-creation metadata.

## Exact next unfinished step

First reconcile the **nine missing bibliography keys** already used by the preserved edits. Do not begin another
full-repository audit. Read the corresponding `current_sources` and findings in the saved contracts JSON reports
and `requirements.md`; integrate only supported bibliography/source-ledger entries. The precise key-to-file map
is in `recovery-state.json`. Then validate that bounded integration and checkpoint it.

```bash
git switch recovery/edo-source-update-20261020T162032Z
git status --short
git diff e8b2ef1a10271b1e6e64bb717a70b1707b57b11e HEAD -- tex/chapters
cat docs/reference/2026-10-comprehensive-audit/recovery-state.json
cat docs/reference/2026-10-comprehensive-audit/batches/requirements-new.bib
make check-acronyms check-tex-structure
make audit-cited-bib-sources check-guide-change-sources
```

Do not assume these validation commands already passed. After bibliography reconciliation, review each surviving
edit against its evidence and reconcile study-memory records before building. Use small coursebook batches.

The full original scope remains open: verify Weeks's rank from the current official flag roster; correct the
command-structure, ASN(RD&A), and NAVSEA figures by label/content; replace obsolete organization/office teaching
with verified NAVSEA/PAE/AL/DRPM information; map ACAT I programs to current offices and parents; finish current
JFRP, PPBE, and DAS verification; review every coursebook page including diagrams and image-only slides; complete
source-to-section coverage; build with the documented toolchain and inspect the rendered PDF, citations,
cross-references, glossary, and consistency. Preserve completed work and list source gaps explicitly.

Current official full-body access gaps include JFRP issuances, DoWI 8430.01, revised RFO attachments,
MSAR preparation guidance, current flag roster, and some NAVSEA/PAE pages. Specific successful and failed source
checks are recorded in saved reports. Do not advance access dates without retrieval or treat proposals as effective.

## Checks actually performed

- Inspected branch, recent commits, staged/unstaged changes, untracked paths, workers, and process list.
- `git diff --check`: passed before handoff edits.
- Parsed all saved audit JSON; verified all 71 coursebook hashes and that their PDFs are tracked.
- Static citation scan: nine undefined keys in edited chapters; recorded in `recovery-state.json`.
- Reviewed task diffs and research-file scope; credential/restricted-marking scan produced no flags in staged
  candidates. Generated coursebook extracts and renderings are excluded from publication.
- Existing `artifacts/out/main.pdf` is unchanged baseline output, SHA-256
  `391fa0ad35d4fed0d1b8f393c3f7ac4e554540cef824b298854def6019c1d05b`.
  The older `artifacts/build/main.log` is dated October 16; it cannot validate these edits.
- No full or focused build was attempted during preservation. No new source/LaTeX validation is claimed.
- Focused `rumdl check` passes for this handoff, checkpoint, saved request, and plan after formatting.
  The preserved `requirements.md` and `maintenance_civpers.md` research notes still fail Markdown lint
  (table alignment, wrapping, bare links, and blank lines); their content was left intact for recovery.
- Initial remote read failed: `Failed to connect to proxy port 8080 ... Could not connect to server`.
  Retrying with the tool's network permission succeeded; origin resolved to GitHub and HEAD matched the starting SHA.
  The recovery commit and remote-branch verification are reported separately after this file is committed.

## Excluded local material

Left intact, excluded from the commit:

- `artifacts/audit/`: 539 generated files, 373,832,284 bytes at snapshot time: extracted text, slide/contact-sheet
  renders, and inspection artifacts. Copy separately only if useful for continuity. They can be regenerated from the
  tracked coursebooks; their existence alone is not review evidence.
- Existing ignored build/TikZ/font caches and temporary outputs. The old tracked guide PDF is unchanged.
- `/workspace/edo-toolchain/`: environment-local toolchain outside this repository; recreate from project setup
  if the replacement environment does not retain it. Its activation script was inspected but no build was started.

The source edits and durable research records needed for continuation are carried by this branch.
Do not blindly add generated artifacts or private/restricted material to this public repository.

## Replacement-task instruction

Start the replacement Codex task from **this recovery branch, not `main`**, and read `RECOVERY_HANDOFF.md`
before doing any work. Preserve the entire original scope and resume with the bibliography integration above.
Check active workers/processes and actual files again; do not assume a failed stream means an operation had no effect.
No further push, merge, publication, or release is authorized by this preservation-only handoff.
