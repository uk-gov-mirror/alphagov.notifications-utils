.DEFAULT_GOAL := help
SHELL := /bin/bash

.PHONY: help
help:
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: bootstrap
bootstrap: ## Build project
	pip install -r requirements_for_test.txt

.PHONY: test
test: ## Run tests
	./scripts/run_tests.sh

clean:
	rm -rf cache venv

.PHONY: fix-imports
fix-imports:
	isort ./notifications_utils ./tests
