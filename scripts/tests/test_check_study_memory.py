"""Exercise the tutor privacy boundary and fresh-clone behavior with isolated Git indexes."""

import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
CHECKER = ROOT / "scripts/check-study-memory.py"


class StudyMemoryTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.memory = self.root / "docs/study_memory"
        self.memory.mkdir(parents=True)
        subprocess.run(["git", "init", "-q", str(self.root)], check=True)
        (self.root / ".gitignore").write_text((ROOT / ".gitignore").read_text(), encoding="utf-8")
        for name in ("README.md", "schemas.md", "sources.md", "study_guide_audit.md", "guide_changes.jsonl"):
            (self.memory / name).write_text("", encoding="utf-8")
        self.git("add", ".gitignore", "docs/study_memory")

    def git(self, *args):
        return subprocess.run(["git", *args], cwd=self.root, check=True, capture_output=True)

    def check(self):
        return subprocess.run([sys.executable, str(CHECKER), str(self.root)], capture_output=True, text=True)

    def test_fresh_clone_needs_no_personal_state(self):
        result = self.check()
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_tracked_personal_record_is_rejected_even_if_ignored(self):
        (self.memory / "learning_log.jsonl").write_text("")
        self.git("add", "-f", "docs/study_memory/learning_log.jsonl")
        result = self.check()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("must be untracked", result.stderr)

    def test_future_artifacts_and_imports_must_be_ignored(self):
        (self.root / ".gitignore").write_text("")
        result = self.check()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("generated/new-deck.md", result.stderr)
        self.assertIn("Chat_Session_Package_probe", result.stderr)

    def test_shared_evidence_is_required(self):
        (self.memory / "sources.md").unlink()
        result = self.check()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("missing required file: docs/study_memory/sources.md", result.stderr)

    def test_local_question_can_cite_new_source_without_shared_ledger_edit(self):
        record = {
            "type": "question", "id": "q-20261020-example", "topic": "example",
            "source_section": "tex/chapters/example.tex", "difficulty": "board_ready",
            "tested_skill": "scenario", "question": "Example?", "answer": "Example answer",
            "explanation": "Example explanation", "created_from_session_id": "local-example",
            "source_basis": [{"title": "Official example", "authority_level": "policy",
                              "url_or_path": "https://www.navy.mil/example", "version_or_date": "2026-10-20",
                              "date_checked": "2026-10-20"}],
        }
        (self.memory / "question_bank.jsonl").write_text(json.dumps(record) + "\n")
        result = self.check()
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_local_malformed_records_are_rejected(self):
        (self.memory / "sessions.jsonl").write_text('[]\n{"broken":\n')
        result = self.check()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("record must be an object", result.stderr)
        self.assertIn("invalid JSON", result.stderr)

    def test_separate_learner_records_are_validated(self):
        learner = self.memory / "learners/new-learner"
        learner.mkdir(parents=True)
        (learner / "learning_log.jsonl").write_text(json.dumps({"type": "learning_event"}) + "\n")
        result = self.check()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("new-learner", result.stderr)
        self.assertIn("missing required fields", result.stderr)


if __name__ == "__main__":
    unittest.main()
