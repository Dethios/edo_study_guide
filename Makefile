.PHONY: force-rebuild-tikz check-tikz-cache
force-rebuild-tikz:
	@project_root="$$(pwd)"; \
	for cache_dir in "$$project_root/artifacts/tikz" "$$project_root/.build/tikz" "$$project_root/build/tikz"; do \
		if [ -d "$$cache_dir" ]; then find "$$cache_dir" -mindepth 1 -delete; fi; \
	done

check-tikz-cache:
	@./scripts/check-tikz-cache.sh
