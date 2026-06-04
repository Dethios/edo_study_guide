.PHONY: force-rebuild-tikz check-tikz-cache check-acronyms check-study-memory check-markdown fmt-markdown
force-rebuild-tikz:
	@project_root="$$(pwd)"; \
	for cache_dir in "$$project_root/artifacts/tikz" "$$project_root/.build/tikz" "$$project_root/build/tikz"; do \
		if [ -d "$$cache_dir" ]; then find "$$cache_dir" -mindepth 1 -delete; fi; \
	done

check-tikz-cache:
	@./scripts/check-tikz-cache.sh

check-acronyms:
	@./scripts/check-acronyms.py

check-study-memory:
	@sh scripts/check-study-memory.sh

check-markdown:
	@rumdl check AGENTS.md README.md CHANGELOG.md
	@rumdl check docs/

fmt-markdown:
	@rumdl fmt AGENTS.md README.md CHANGELOG.md
	@rumdl fmt docs/
