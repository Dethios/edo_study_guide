# Original task scope retained for continuation

User request from 2026-10-20, preserved below. The later preservation request pauses implementation and authorizes
only a recovery branch, snapshot commit, and push of that branch. This file does not authorize a release or main push.

Update the edo_study_guide repository in place. Implement the changes, not merely a plan or recommendations.
The objective is a current, comprehensive, internally consistent EDO study guide aligned with every available updated
coursebook and authoritative official sources.

## 1. Preserve existing work and make execution resumable

Read the repository instructions and build conventions. Inspect git status, recent commits, existing diffs, and any
saved audit notes before editing. Determine which requested changes are already complete. Preserve completed work and
unrelated user changes; do not reset, clean, or overwrite the workspace to start over.

Work in bounded passes and small coursebook batches. Maintain a repository-local checkpoint and coverage matrix
recording completed work, sources reviewed, files changed, validation results, unresolved issues, and the next concrete
step. Update them after each pass, not only at the end. If interrupted, inspect the saved state and resume unfinished
work rather than repeating the entire audit.

Continue through implementation and validation without waiting for approval between routine passes. If blocked on one
source, document the gap and continue independent work. Follow any existing explicitly authorized commit/release
workflow; otherwise do not push, publish, or create a release.

## 2. Establish complete source coverage

Inventory every available coursebook, including version/date and page count. Create a coverage matrix linking learning
objectives and substantive topics to source slide/page ranges and study-guide sections. Track review status, required
changes, implemented changes, and unresolved gaps.

Review every coursebook systematically, including diagrams, tables, screenshots, and image-only slides. Use visual
inspection or OCR when text extraction is insufficient. Include all substantive study-relevant information without
copying every slide verbatim or duplicating explanations. Do not impose an arbitrary page-count target. A keyword search
or extracted-text scan alone is not a complete review.

Use coursebooks to define instructional scope. Verify time-sensitive facts against current official directives, rosters,
organizational pages, program-office sites, and official announcements. Record source dates and effective dates.
Distinguish implemented changes from proposals and future announcements. Resolve conflicts explicitly rather than
silently favoring newer-looking material or assuming an old slide remains authoritative.

## 3. Correct leadership and figures

Locate the figures by their labels, content, and source files as well as their current displayed numbers, since
numbering may change.

- PAE leadership table: Verify Todd Weeks's current rank against the official Navy flag officer roster. Use the correct
  abbreviation for that verified rank, distinguishing RDML from RADM. Standardize rank formatting across the table and
  related references.
- Figure 1.1: Replace the outdated graphic with the updated graphic from coursebook 2.1.1. Verify the correct coursebook
  version and slide. Preserve legibility and identify its source.
- Figure 1.3: Replace the update-note caption with a useful explanation of what the image shows and its study
  significance. Format its source using the established source macro and citation convention demonstrated by Figure 1.2.
- Figure 1.5: Check whether NAVSEA has now released a replacement organization chart. If available, use the current
  official chart. Otherwise retain the February 2026 chart with a caption clearly identifying it as outdated and stating
  that an updated official chart has not been published as of the verification date. Explain the current organization
  separately; do not present the historical image as current.

## 4. Replace obsolete organizational information

Remove superseded legacy program-office and organizational material from the main study content. Replace it with
verified current NAVSEA, PAE, AL, and DRPM information from updated coursebooks and official sources. Verify acronym
expansions, leadership, responsibilities, reporting relationships, and organizational boundaries rather than assuming
their meaning.

Identify and list current program offices from official PAE sites and corroborating official announcements. Do not
assume every older office was abolished, renamed, or transferred. Verify each transition and remove obsolete
descriptions while preserving still-current responsibilities.

Realign ACAT I programs to their verified current program offices and parent organizations. Maintain a sourced mapping
of program, current office, parent organization, and supporting evidence. Flag unresolved assignments instead of
guessing. Retain historical context only when necessary to explain a transition, clearly labeled as historical rather
than current study material.

## 5. Update requirements, PPBE, and DAS

Add a substantive section on the current joint force requirements process. Verify its official name, governing
authority, effective dates, applicability, participants, workflow, decision points, outputs, and connections to
acquisition and resourcing.

Remove the obsolete standalone JCIDS section. Retain only minimal transition context where necessary to explain the
current process or reconcile older coursebooks. Check related references throughout the guide so obsolete JCIDS
terminology does not remain presented as current.

Audit and update PPBE and DAS using the updated coursebooks and current official authorities. Verify terminology,
responsibilities, process steps, milestones, decision authorities, documentation, and interfaces among requirements,
acquisition, and budgeting. Distinguish current implementation from announced reforms. Do not merely rename headings
while leaving outdated explanations underneath.

## 6. Execute and validate in manageable passes

Suggested sequence:

- Establish the baseline, inventory, and coverage matrix.
- Correct leadership and Figures 1.1, 1.3, and 1.5.
- Update organizations, program offices, and ACAT I mappings.
- Update the requirements process, PPBE, and DAS.
- Complete the remaining coursebook-by-coursebook audit in small batches.
- Perform an integrated consistency review and final build.

Use parallel research only where supported and genuinely independent. Avoid concurrent edits to the same files;
reconcile findings before integration. Save checkpoints throughout and provide concise progress updates identifying
completed work and remaining gaps.

Build with the repository's documented toolchain, preserving its LaTeX structure, styles, macros, and citation
conventions. Inspect the rendered PDF, especially changed figures, captions, tables, page breaks, and labels. Check
citations, source macros, cross-references, numbering, contents, glossary entries, and consistency across chapters.
Search for stale organizational terms and conflicting program assignments. Distinguish pre-existing build issues from
problems introduced by this update.

## 7. Completion criteria and final report

Deliver the updated source and generated study guide through the existing project workflow, together with:

- A concise summary of substantive changes and affected sections.
- The completed coursebook coverage matrix and source-to-section traceability.
- Actual build commands and validation results.
- A list of unresolved items, each identifying the precise missing source, uncertainty, or access blocker.

Do not claim the audit is complete if any coursebook, relevant image-only slide, or required authoritative source
remains unreviewed. If execution stops before completion, leave a clear checkpoint identifying the exact next step and
what has already been verified.
