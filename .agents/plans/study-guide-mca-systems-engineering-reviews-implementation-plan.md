# Study Guide MCA Systems Engineering Reviews Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use `subagent-driven-development` or `executing-plans` to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Integrate source-checked Navy MCA systems-engineering review content into the EDO study guide without adding short-answer prompts or flashcards.

**Architecture:** Keep `tex/chapters/17I_CM_and_Technical_Reviews.tex` as the authoritative home for the review lifecycle, baseline maturity, required-review policy notes, common traps, and Navy participant/authority summary. Use narrow cross-chapter updates only to point EVM, milestones, systems engineering, JCIDS, and T&E content back to that authority section instead of duplicating a full review matrix. Treat IBR as a management-baseline review: summarize it in `17I` only enough to contrast it with technical reviews, then keep substantive IBR detail in `14_EVM.tex`.

**Tech Stack:** LaTeX source under `projects/edo_study_guide/tex`, `biblatex` bibliography in `tex/edo.bib`, acronyms in `tex/acronyms.def`, project docs in Markdown, validation through `./scripts/docker-build.sh tex/main.tex` plus focused `rg` and `git diff --check` checks.

---

## Planning Inputs

Current local evidence:

- `projects/edo_study_guide/AGENTS.md` requires current primary-source checks for doctrine, `\autocite{}` citations, `\ac{}` acronyms in prose, `longtblr` for tables, Docker LaTeX validation, and scoped edits.
- The study-guide submodule is already dirty in `tex/chapters/17G_Systems_Engineering_Overview.tex`, `tex/chapters/17I_CM_and_Technical_Reviews.tex`, `tex/chapters/17K_jcids.tex`, and `tex/chapters/18B_test-eval.tex`. Preserve and work with these changes.
- `17I_CM_and_Technical_Reviews.tex` already contains `MCA Technical Reviews by Phase`, including ASR, SRR, SFR, PDR, CDR, TRR, SVR/FCA, PRR, OTRR, and PCA. Do not add a second duplicate lifecycle table.
- `14_EVM.tex` already has an `Integrated Baseline Review` subsection, but it is sourced only to the coursebook entry and should be aligned with FAR 34.202 if policy detail is added.
- `16_Milestones.tex` already mentions PDR, CDR, and IBR in milestone context; use brief cross-references rather than duplicating review-by-review material.
- `18B_test-eval.tex` already has TRR-adjacent T&E content and DoDI 5000.98 material. It also still cites older Title 10 keys such as `USC-10-2366` and `USC-10-2399`; the implementation must audit whether those references are outdated before expanding T&E review content.
- `tex/acronyms.def` already defines `asr`, `srr`, `sfr`, `pdr`, `cdr`, `trr`, `svr`, `otrr`, `prr`, `fca`, `pca`, `ibr`, `evms`, `pmb`, `dote`, `optevfor`, and `supship`. Do not add duplicate acronym keys.
- `README.me` does not exist in the project; the applicable file is `projects/edo_study_guide/README.md`.

Current source anchors checked for planning:

- DoDI 5000.88, `3.5. Program Technical Reviews and Assessments`, requires system-level SRR or SFR, PDR, CDR, SVR or FCA, PRR, and PCA unless waived through SEP approval, and covers OUSD(R&E)/Component PDR/CDR assessment roles: https://www.esd.whs.mil/Portals/54/Documents/DD/issuances/dodi/500088p.PDF?ver=O8LFc8NzlyJX-SgM2Haalw%3D%3D
- FAR 34.202 states the Government conducts an IBR when EVMS is required and defines the IBR purpose around technical content plus performance budget, resource, and schedule realism: https://www.acquisition.gov/far/34.202
- DAU Technical Reviews and Audits summarizes ASR, SFR, PDR, CDR, SVR/FCA, PRR, PCA, and related review terms: https://www.dau.edu/tools/dau-systems-engineering-brainbook/technical-reviews-and-audits
- DoD Systems Engineering Guidebook, February 2022, Section 3, provides detailed products, criteria, review sequencing, and Technical Review Chair completion language: https://ac.cto.mil/wp-content/uploads/2022/02/Systems-Eng-Guidebook_Feb2022-Cleared-slp.pdf

## Architecture Decision

### Option A: Create a New Dedicated Chapter

Pros:

- Clean standalone structure for the full review matrix.
- Easy to find as a single chapter.

Cons:

- Duplicates existing `17I` technical-review coverage.
- Forces table-of-contents and chapter-order changes for content that already belongs under configuration management and technical reviews.
- Higher risk of stale cross-chapter duplication.

### Option B: Expand Existing `17I` and Cross-Reference From Adjacent Chapters

Pros:

- Preserves the current chapter boundary: configuration baselines and technical reviews live together.
- Avoids duplicate lifecycle tables.
- Lets EVM, milestones, JCIDS, and T&E chapters keep only their local context.
- Matches the user's request to insert content in the correct context.

Cons:

- `17I` will become denser and needs careful table design to avoid overfull boxes.
- Requires disciplined cross-references so adjacent chapters do not drift.

### Option C: Split the Content Across Every Related Chapter

Pros:

- Puts each review near its adjacent topic.

Cons:

- Highest duplication risk.
- Makes future source audits harder.
- Weakens the high-yield baseline-maturity mental model by scattering it.

**Preferred option:** Option B. Expand `17I` as the canonical review lifecycle section, keep IBR detail in `14_EVM.tex`, and add narrow cross-references or one-sentence alignment updates in adjacent chapters only when they remove ambiguity.

## Target File Map

Modify:

- `projects/edo_study_guide/tex/chapters/17I_CM_and_Technical_Reviews.tex` - primary content home; expand the existing MCA review section into the authoritative lifecycle/baseline/review-matrix treatment.
- `projects/edo_study_guide/tex/chapters/14_EVM.tex` - update IBR subsection with FAR 34.202 grounding and contrast IBR with technical reviews.
- `projects/edo_study_guide/tex/chapters/16_Milestones.tex` - keep milestone references concise and point readers to `17I`; clarify PDR/CDR assessment relevance if not already clear.
- `projects/edo_study_guide/tex/chapters/17G_Systems_Engineering_Overview.tex` - keep only overview-level SEP/review criteria linkage if current text needs refinement.
- `projects/edo_study_guide/tex/chapters/18B_test-eval.tex` - update TRR/OTRR references only where needed and audit outdated DoDI 5000.89 / 5000.98 / Title 10 references.
- `projects/edo_study_guide/tex/chapters/17K_jcids.tex` - update only if review content relies on requirements traceability language already being edited there.
- `projects/edo_study_guide/tex/chapters/appendix_key_roles.tex` - update only if the participant/authority treatment changes durable role summaries.
- `projects/edo_study_guide/tex/edo.bib` - add or refresh FAR 34.202 and DAU Technical Reviews entries if missing; refresh DoDI 5000.88 and SE Guidebook metadata only after source verification.
- `projects/edo_study_guide/tex/acronyms.def` - verify no missing acronym keys; no expected additions based on current scan.
- `projects/edo_study_guide/CHANGELOG.md` - add an Unreleased entry for the content update.
- `projects/edo_study_guide/README.md` - update only if the content change adds a durable navigation/build/source-recency note useful to users.
- `projects/edo_study_guide/AGENTS.md` - update only if the implementation reveals stale project instructions. Do not edit solely because this plan mentions it.

Do not create:

- A short-answer prompts section.
- A flashcard section.
- A duplicate standalone technical-review chapter.

## Implementation Tasks

### Task 1: Baseline, Instructions, and Source Audit

**Files:**

- Read: `projects/edo_study_guide/AGENTS.md`
- Read: `projects/edo_study_guide/tex/chapters/17I_CM_and_Technical_Reviews.tex`
- Read: `projects/edo_study_guide/tex/chapters/14_EVM.tex`
- Read: `projects/edo_study_guide/tex/chapters/16_Milestones.tex`
- Read: `projects/edo_study_guide/tex/chapters/17G_Systems_Engineering_Overview.tex`
- Read: `projects/edo_study_guide/tex/chapters/18B_test-eval.tex`
- Read: `projects/edo_study_guide/tex/edo.bib`
- Read: `projects/edo_study_guide/tex/acronyms.def`

- [ ] **Step 1: Capture working tree state before edits**

  Run:

  ```bash
  git -C projects/edo_study_guide status --short --branch
  git -C projects/edo_study_guide diff --stat
  ```

  Expected: the submodule may already show local modifications in `17G`, `17I`, `17K`, and `18B`. Treat them as user-owned until confirmed otherwise.

- [ ] **Step 2: Re-read project instructions**

  Run:

  ```bash
  sed -n '1,240p' projects/edo_study_guide/AGENTS.md
  ```

  Expected: confirm source-recency, citation, acronym, table, and validation rules before editing.

- [ ] **Step 3: Verify current official sources**

  Use official/current sources before changing doctrine text:

  - DoDI 5000.88 current PDF or issuance page.
  - FAR 34.202 on Acquisition.gov.
  - DoD Systems Engineering Guidebook, February 2022.
  - DAU Technical Reviews and Audits page.
  - Current DoDI 5000.98 and current Title 10 sections if touching T&E/LFT&E/OT&E text.

  Record the checked source dates and URLs in citation metadata or comments only where the repo convention supports it.

- [ ] **Step 4: Audit existing bibliography metadata**

  Run:

  ```bash
  rg -n "DoDI5000-88|DoD-EngineeringDefenseSystemsGuidebook|FAR34|FAR-34|Technical Reviews|Integrated Baseline Review|USC-10-2366|USC-10-2399|DoDI5000-98" projects/edo_study_guide/tex/edo.bib
  ```

  Expected: identify whether FAR 34.202 and DAU Technical Reviews already have citation keys. Also verify whether the existing `DoWI` / `Department of War` naming in `DoDI5000-88` is intentional project-wide terminology or stale metadata before changing it.

### Task 2: Expand `17I` as the Canonical Review Lifecycle Section

**Files:**

- Modify: `projects/edo_study_guide/tex/chapters/17I_CM_and_Technical_Reviews.tex`

- [ ] **Step 1: Replace the current single-paragraph/table treatment with a structured `Major Systems Engineering Reviews in Navy Acquisition` subsection**

  Keep the section under the existing technical reviews area. Use this order:

  1. `Summary`
  2. `Review Lifecycle and Baseline Maturity`
  3. `System-Level Review Matrix`
  4. `Navy Participants and Authorities`
  5. `Common Traps`
  6. `Quick Review`

  Do not add prompt or flashcard sections.

- [ ] **Step 2: Preserve the baseline mental model**

  Include the high-yield distinction in prose:

  ```latex
  Technical reviews mature and control the product baseline; \ac{ibr} validates the executable management baseline.
  ```

  Source the technical-review side to DoDI 5000.88 and the SE Guidebook; source the IBR side to FAR 34.202.

- [ ] **Step 3: Update the lifecycle table instead of duplicating it**

  Revise the existing `longtblr` so it covers:

  - ASR - preferred materiel solution.
  - SRR - system requirements.
  - SFR - functional baseline.
  - PDR - allocated baseline.
  - CDR - initial product baseline.
  - TRR - test readiness.
  - SVR/FCA - verified functional/allocated baseline.
  - PRR - production process readiness.
  - OTRR - operational test readiness, if retained for Navy board context.
  - PCA - as-built/product baseline.
  - IBR - performance measurement baseline, clearly marked as a parallel management-baseline review rather than a systems-engineering design review.

  Keep the table compact enough for LaTeX. If the full detail from the pasted source causes an overfull table, move detail into short `description` items below the table rather than widening columns.

- [ ] **Step 4: Add policy notes without over-quoting**

  Cover these points:

  - DoDI 5000.88 policy minimum is SRR or SFR, not necessarily both.
  - PDR, CDR, SVR/FCA, PRR, and PCA are system-level reviews unless waived through SEP approval.
  - OUSD(R&E) participates in ACAT ID reviews and conducts ACAT ID PDR/CDR assessments; Components conduct PDR/CDR assessments for other MDAPs.
  - Reviews should be criteria-based and documented through SEP entrance/exit criteria.

- [ ] **Step 5: Add review-by-review details in board-prep density**

  For ASR, SRR, SFR, PDR, CDR, TRR, SVR/FCA, PRR, PCA, and IBR, include:

  - Full name.
  - Typical timing.
  - Purpose.
  - Key inputs.
  - Key outputs.
  - Dependency for.
  - Participants or authority notes.
  - One critical trap.

  Keep each review to a concise row or `description` entry. Do not paste the full long-form matrix verbatim if it overwhelms the chapter.

- [ ] **Step 6: Add Navy-specific participants**

  Include Navy-specific participants in one compact list:

  - PEO/PMS/PMW.
  - NAVSEA/NAVAIR/NAVWAR technical authorities.
  - OPTEVFOR when operational testing is implicated.
  - Requirements/resource sponsor and Fleet representatives.
  - Warfare centers, labs, ranges, SUPSHIP, DCMA, quality, manufacturing, product support, cybersecurity, safety, and HSI stakeholders as applicable.

### Task 3: Update Cross-Chapter Context Without Duplicating `17I`

**Files:**

- Modify: `projects/edo_study_guide/tex/chapters/14_EVM.tex`
- Modify if needed: `projects/edo_study_guide/tex/chapters/16_Milestones.tex`
- Modify if needed: `projects/edo_study_guide/tex/chapters/17G_Systems_Engineering_Overview.tex`
- Modify if needed: `projects/edo_study_guide/tex/chapters/18B_test-eval.tex`
- Modify if needed: `projects/edo_study_guide/tex/chapters/17K_jcids.tex`
- Modify if needed: `projects/edo_study_guide/tex/chapters/appendix_key_roles.tex`

- [ ] **Step 1: Strengthen IBR in `14_EVM.tex`**

  Add FAR 34.202 grounding to the existing `Integrated Baseline Review` subsection:

  - IBR occurs when EVMS is required.
  - Purpose is to verify technical content and realism of performance budgets, resources, and schedules.
  - It is a joint Government/contractor assessment of scope, schedule, PMB realism, resources, and management-control process.
  - It is not a design review, even though it depends on credible technical scope.
  - It can recur after major replanning or PMB changes when applicable policy/procedure requires it.

- [ ] **Step 2: Keep milestone chapter links short**

  In `16_Milestones.tex`, update PDR/CDR/IBR mentions only if they are stale or ambiguous. Point the reader to the canonical `17I` section for the review lifecycle instead of embedding another review table.

- [ ] **Step 3: Keep systems-engineering overview high level**

  In `17G_Systems_Engineering_Overview.tex`, keep only a summary statement that the SEP defines tailored review criteria and that technical reviews control baseline maturity. Do not duplicate the review matrix.

- [ ] **Step 4: Audit T&E and TRR/OTRR content**

  In `18B_test-eval.tex`, add or refine a sentence that TRR protects test validity, safety, configuration control, instrumentation, data criteria, and executability. If touching statutory/OT&E/LFT&E language, verify current Title 10 and DoDI 5000.98 citations first and update outdated `USC-10-2366` or `USC-10-2399` references as needed.

- [ ] **Step 5: Keep JCIDS traceability focused**

  In `17K_jcids.tex`, update only if the technical-review content needs a cleaner CDD/requirements traceability bridge. Do not add review lifecycle content here.

### Task 4: Bibliography, Acronyms, and Documentation

**Files:**

- Modify if needed: `projects/edo_study_guide/tex/edo.bib`
- Modify if needed: `projects/edo_study_guide/tex/acronyms.def`
- Modify: `projects/edo_study_guide/CHANGELOG.md`
- Modify if needed: `projects/edo_study_guide/README.md`
- Modify if needed: `projects/edo_study_guide/AGENTS.md`

- [ ] **Step 1: Add or refresh source entries**

  Ensure the bibliography supports all new citations:

  - `DoDI5000-88` for system-level technical review policy.
  - `DoD-EngineeringDefenseSystemsGuidebook-2024` or the existing SE Guidebook key for review criteria.
  - A FAR 34.202 citation key for IBR, if no current key exists.
  - A DAU Technical Reviews and Audits citation key, if used for concise review definitions.

- [ ] **Step 2: Verify acronym coverage**

  Run:

  ```bash
  rg -n "asr|srr|sfr|pdr|cdr|trr|svr|otrr|prr|fca|pca|ibr|evms|pmb|dote|optevfor|supship" projects/edo_study_guide/tex/acronyms.def
  ```

  Expected: existing keys cover the planned content. Add only genuinely missing acronyms.

- [ ] **Step 3: Update `CHANGELOG.md`**

  Add an Unreleased bullet under `Changed` similar to:

  ```markdown
  - Expanded MCA systems-engineering review coverage with source-checked baseline maturity, authority, participant, and IBR contrast notes.
  ```

- [ ] **Step 4: Decide whether README or AGENTS updates are appropriate**

  Update `README.md` only if the implementation changes user-facing build, navigation, source-recency, or release workflow guidance. Update `AGENTS.md` only if the content audit reveals stale instructions. Otherwise leave both unchanged and report that no update was appropriate.

### Task 5: Validation and Final Review

**Files:**

- Validate: `projects/edo_study_guide/tex/main.tex`
- Validate: edited LaTeX, bibliography, and docs

- [ ] **Step 1: Check formatting hazards and duplicate-forbidden content**

  Run:

  ```bash
  git -C projects/edo_study_guide diff --check
  rg -n "short-answer|Short-answer|flashcard|Flashcard|Board-style short-answer" projects/edo_study_guide/tex/chapters/17I_CM_and_Technical_Reviews.tex
  ```

  Expected: no whitespace errors. The `rg` command should find no newly added short-answer prompt or flashcard section.

- [ ] **Step 2: Check source keys and stale-reference risk**

  Run:

  ```bash
  rg -n "DoDI5000-88|FAR34|FAR-34|DoD-EngineeringDefenseSystemsGuidebook|DAU" projects/edo_study_guide/tex/chapters/17I_CM_and_Technical_Reviews.tex projects/edo_study_guide/tex/chapters/14_EVM.tex projects/edo_study_guide/tex/edo.bib
  rg -n "USC-10-2366|USC-10-2399|DoDI5000-89|DoDI5000-98" projects/edo_study_guide/tex/chapters/18B_test-eval.tex projects/edo_study_guide/tex/chapters/appendix_key_roles.tex projects/edo_study_guide/tex/edo.bib
  ```

  Expected: source keys are present where cited. The stale-reference audit may still show valid historical keys, but any outdated statutory/policy claims touched by this work must be corrected or explicitly left untouched with a caveat.

- [ ] **Step 3: Build the study guide**

  Run from `projects/edo_study_guide`:

  ```bash
  ./scripts/docker-build.sh tex/main.tex
  ```

  If Docker is unavailable, run:

  ```bash
  ./scripts/build.sh tex/main.tex
  ```

  Expected: build exits 0. If it fails because Docker Desktop or LaTeX tooling is unavailable, report the exact blocker and run `git diff --check` plus focused source checks as partial validation.

- [ ] **Step 4: Check LaTeX warning indicators**

  Run from `projects/edo_study_guide` after a build attempt:

  ```bash
  rg "undefined citation|Citation .* undefined|Reference .* undefined|Missing character|Overfull \\\\hbox|TODO" tex artifacts/build
  ```

  Expected: no new missing citations, missing refs, or severe table warnings introduced by this change. Report any pre-existing warnings separately.

- [ ] **Step 5: Final implementation report**

  Return:

  - Files changed.
  - Content summary by chapter.
  - Current-source checks performed.
  - Validation commands and results.
  - Residual risks or blockers.
  - Whether `README.md` and `AGENTS.md` required updates.

## Stop Conditions

Stop and ask for direction if:

- Implementing the review matrix would require rewriting large unrelated portions of `17I`.
- Existing dirty changes conflict with the planned insertion and cannot be safely merged.
- Current official sources conflict on a policy point central to the answer.
- A dependency upgrade or new LaTeX package is needed.
- Build/test failures appear broad and unrelated to the content change.
- The work would require deleting or renaming chapters, changing release artifacts, or touching credentials/secrets.

## Completion Criteria

The implementation is complete when:

- The requested systems-engineering review content is integrated in context, primarily in `17I`, without short-answer prompts or flashcards.
- IBR is clearly distinguished from technical design reviews and cross-referenced to EVM content.
- Outdated content touched by the change has been audited and corrected or explicitly reported as outside scope.
- `CHANGELOG.md` has an Unreleased entry.
- `README.md` and `AGENTS.md` are updated only if appropriate.
- Validation commands have been run and results are reported.
