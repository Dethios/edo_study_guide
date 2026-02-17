.PHONY: force-rebuild-tikz check-tikz-cache
force-rebuild-tikz:
	@workspace_root="$$(git rev-parse --show-superproject-working-tree 2>/dev/null || pwd)"; \
	for cache_dir in "$$workspace_root/.build/tikz" "$$workspace_root/build/tikz"; do \
		if [ -d "$$cache_dir" ]; then find "$$cache_dir" -mindepth 1 -delete; fi; \
	done

check-tikz-cache:
	@./scripts/check-tikz-cache.sh
