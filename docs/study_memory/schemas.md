# Study Memory Schemas

All JSONL files are append-only. Each nonblank line must be a complete JSON
object with a `type` field. Dates use `YYYY-MM-DD`.

## `sessions.jsonl`

Required fields:

- `type`: must be `session`
- `session_id`: stable unique ID
- `date`: session date
- `mode`: session mode, such as `imported_long_session`, `tutoring`,
  `audit`, or `review`
- `objectives`: array
- `topics`: array
- `source_basis`: array
- `questions_covered`: number
- `misses`: array
- `weak_areas_added`: array
- `guide_updates_identified`: array
- `next_actions`: array
- `source_package`: repo-relative path, stable source label, URL, or null.
  Historical imports may retain their original absolute path, but new records
  should not use machine-local absolute paths.

Example:

```json
{"type":"session","session_id":"2026-05-30-import","date":"2026-05-30","mode":"imported_long_session","objectives":[],"topics":[],"source_basis":[],"questions_covered":0,"misses":[],"weak_areas_added":[],"guide_updates_identified":[],"next_actions":[],"source_package":"docs/EDO_Study_Guide_Chat_Session_Package_2026-05-30"}
```

## `weak_areas.jsonl`

Required fields:

- `type`: must be `weak_area`
- `id`: stable weak-area ID
- `date`: date identified or updated
- `topic`
- `subtopic`
- `evidence`
- `miss_type`: `factual_recall`, `concept_confusion`, `source_version`,
  `application`, `wording_ambiguity`, `careless_error`, or `unknown`
- `severity`: `low`, `medium`, or `high`
- `next_review_date`
- `status`: `active`, `improving`, or `resolved`
- `source_session_id`

Example:

```json
{"type":"weak_area","id":"wa-YYYYMMDD-topic-slug","date":"YYYY-MM-DD","topic":"","subtopic":"","evidence":"","miss_type":"unknown","severity":"medium","next_review_date":"YYYY-MM-DD","status":"active","source_session_id":""}
```

## `guide_changes.jsonl`

Required fields:

- `type`: must be `guide_change`
- `id`: stable guide-change ID
- `date_identified`
- `study_guide_claim`
- `location`
- `status`: `proposed`, `applied`, `rejected`, or `blocked`
- `verdict`: `Applied`, `Correct`, `Incorrect`, `Outdated`, `Ambiguous`, or
  `Needs source`
- `corrected_answer`
- `source_basis`: array of source objects
- `confidence`: `High`, `Medium`, or `Low`
- `notes`

Applied records must include nonempty `source_basis`, nonempty `confidence`,
and a `location`.

Example:

```json
{"type":"guide_change","id":"gc-YYYYMMDD-topic-slug","date_identified":"YYYY-MM-DD","study_guide_claim":"","location":"","status":"proposed","verdict":"Needs source","corrected_answer":"","source_basis":[{"title":"","authority_level":"policy","url_or_path":"","version_or_date":"","date_checked":"YYYY-MM-DD"}],"confidence":"Low","notes":""}
```

## `question_bank.jsonl`

Required fields:

- `type`: must be `question`
- `id`
- `topic`
- `source_section`: repo path, semicolon-separated repo paths, or stable
  reference such as `session:<session_id>`. Historical May 30 imported
  questions may retain `May 30 lookup deck` or `May 30 study_state.md drill
  queue`, but new questions should use stable references.
- `difficulty`: `basic`, `intermediate`, or `board_ready`
- `tested_skill`: `recall`, `application`, `comparison`, or `scenario`
- `question`
- `answer`
- `explanation`
- `source_basis`
- `created_from_session_id`

Example:

```json
{"type":"question","id":"q-YYYYMMDD-topic-slug","topic":"","source_section":"","difficulty":"board_ready","tested_skill":"scenario","question":"","answer":"","explanation":"","source_basis":[],"created_from_session_id":""}
```

## `learning_log.jsonl`

Required fields:

- `type`: must be `learning_event`
- `date`
- `session_id`
- `question_id`
- `user_answer_summary`
- `result`: `correct`, `partial`, `incorrect`, or `skipped`
- `miss_type`: `factual_recall`, `concept_confusion`, `source_version`,
  `application`, `wording_ambiguity`, `careless_error`, or `none`
- `weak_area_id`
- `next_review_date`

Example:

```json
{"type":"learning_event","date":"YYYY-MM-DD","session_id":"","question_id":"","user_answer_summary":"","result":"incorrect","miss_type":"concept_confusion","weak_area_id":"","next_review_date":"YYYY-MM-DD"}
```
