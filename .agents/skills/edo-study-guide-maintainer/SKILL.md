---
name: edo-study-guide-maintainer
description: Use when the user authorizes a bounded EDO study-guide text, figure, citation, or answer-key update. Do not use to expand tutoring-only requests into guide rewrites or to resolve unsupported doctrine by editing first.
---

# Bounded study-guide maintenance

## Prerequisites and inputs

Read `AGENTS.md`, target content and existing diffs/checkpoints. Establish edit scope, canonical owning section,
verified source basis and acceptance criteria. Use `edo-doctrine-verifier` for unresolved currentness or source
conflicts. Search related chapters before adding material. Resolve paths from this checkout, never another workspace's
prefix.

## Procedure

1. Define a small edit contract. Keep one writer per file; main agent integrates any delegated work. Do not bundle an
   unrelated comprehensive guide audit into a correction.
2. Edit canonical coverage and narrow cross-references. Preserve LuaLaTeX, minted, acronym keys, bibliography
   conventions, `\autocite{}` before punctuation and `\srcCite{}` for whole tables/figures. Follow nearby placement,
   labels and styling. Keep IBR substance in `tex/chapters/14_EVM.tex`, technical reviews in
   `17I_CM_and_Technical_Reviews.tex`, and avoid duplicating them in milestones or systems-engineering overview
   chapters. Discover other owners from `tex/main.tex` and search results rather than relying on a stale chapter map.
3. For content corrections, record original claim, classification, corrected answer, authority, rationale and confidence
   using `docs/study_memory/README.md`. Add bibliography/source-ledger entries when needed; mark applied only after
   the target file was edited and validated. Preserve append-only records and historical dates.
4. Run relevant checks from `AGENTS.md`. Build changed TeX/figures with the established toolchain, not only when the
   user separately requests a build. Ensure no competing LaTeX/LaTeX Workshop build. Prefer Docker locally when the
   image and daemon are available, native LuaLaTeX/latexmk in a provisioned Cloud environment:

   ```bash
   ./scripts/docker-build.sh tex/main.tex
   # Native alternative:
   ./scripts/build.sh tex/main.tex
   ```

   `--clean` cleans and exits; it is a separate, potentially destructive retry step, not a rebuild. Diagnose first.
   For a small independent chapter edit, a supported subfile build can be sufficient; verify parent integration when
   labels, bibliography, TOC, shared styles or chapter flow change. Do not rebuild every coursebook.
5. Check the build exit status and actual log location. Inspect undefined citations/references, missing glyphs, overfull
   boxes and shell-escape failures. Report baseline warnings separately from newly introduced ones. A generated PDF
   or `latexmk` exit alone does not establish correct layout.
6. Use `pdfinfo`/text search to locate changed pages. Render and open affected pages plus adjacent pagination and
   affected TOC/cross-reference pages. Inspect table boundaries, readable labels, attribution, clipping, overlap and
   blank pages. Example physical-page rendering:

   ```bash
   mkdir -p scratch/pdf-review
   pdftoppm -f 20 -l 22 -scale-to 1800 -png artifacts/out/main.pdf scratch/pdf-review/page
   ```

   Record actual pages viewed. If rendering/viewing or build dependencies are unavailable, state that validation is
   incomplete. Never replace the tracked PDF with failed/partial output. For documentation-only changes, validate
   instructions, metadata and links without rebuilding or replacing the published PDF.

## Outputs and validation

Return changed paths, evidence basis, commands and results, PDF pages inspected and residual warnings/limits. Update
`CHANGELOG.md` for notable changes. Inspect `git diff --check`, final diff and generated-artifact status before
delivery. Do not publish or run release helpers without explicit authorization.
