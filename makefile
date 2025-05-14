.PHONY: .uv
.uv: ## Check that uv is installed
	@uv --version || echo 'Please install uv: https://docs.astral.sh/uv/getting-started/installation/'

.PHONY: .venv
.venv: ## Create virtual environment using uv
	@test -d .venv || uv venv

.PHONY: .activate
.activate: .venv
	@. .venv/bin/activate

.PHONY: install
install: .uv ## Install the package, dependencies, and pre-commit for local development
	uv sync --frozen --all-extras --all-packages --all-groups

.PHONY: sync
sync: .uv ## Update local packages and uv.lock
	uv sync --all-extras --all-packages --all-groups
