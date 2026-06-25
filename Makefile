.DEFAULT_GOAL := help

STOW := stow

CONFIG_TARGET := $(HOME)/.config
HOME_TARGET := $(HOME)

REAL_TARGET_DIRECTORIES := \
	$(CONFIG_TARGET) \
	$(HOME_TARGET)/.bashrc.d \
	$(HOME_TARGET)/.local \
	$(HOME_TARGET)/.claude

CONFIG_PACKAGES := fish starship tmux wezterm
HOME_PACKAGES := home

.PHONY: prepare-targets
prepare-targets:
	@for target_directory in $(REAL_TARGET_DIRECTORIES); \
	do \
		if [ -L "$$target_directory" ]; then \
			echo "Refusing to continue: $$target_directory is a symlink."; \
			echo "It must be a real directory before running stow."; \
			exit 1; \
		fi; \
		mkdir --parents "$$target_directory"; \
	done

.PHONY: dry-run
dry-run: prepare-targets ## Preview Stow symlink changes without applying them.
	$(STOW) --no --verbose --restow --target="$(CONFIG_TARGET)" $(CONFIG_PACKAGES)
	$(STOW) --no --verbose --restow --target="$(HOME_TARGET)" $(HOME_PACKAGES)

.PHONY: install
install: prepare-targets ## Install or update all managed dotfiles.
	$(STOW) --restow --target="$(CONFIG_TARGET)" $(CONFIG_PACKAGES)
	$(STOW) --restow --target="$(HOME_TARGET)" $(HOME_PACKAGES)

.PHONY: uninstall
uninstall: ## Remove all managed symlinks.
	$(STOW) --delete --target="$(CONFIG_TARGET)" $(CONFIG_PACKAGES)
	$(STOW) --delete --target="$(HOME_TARGET)" $(HOME_PACKAGES)

.PHONY: help
help: ## Show this help message.
	@echo "Usage:"
	@echo "  make <target>"
	@echo ""
	@echo "Commands:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: doctor
doctor: ## Check required tools and dotfiles environment.
	@command -v stow >/dev/null || { echo "Missing dependency: stow"; exit 1; }
	@echo "Required tools:"
	@echo "  stow: $$(command -v stow)"
	@echo
	@echo "Target directories:"
	@echo "  CONFIG_TARGET: $(CONFIG_TARGET)"
	@echo "  HOME_TARGET:   $(HOME_TARGET)"
	@echo
	@echo "Package groups:"
	@echo "  CONFIG_PACKAGES: $(CONFIG_PACKAGES)"
	@echo "  HOME_PACKAGES:   $(HOME_PACKAGES)"
	@echo
	@echo "Directories that must remain real directories:"
	@for target_directory in $(REAL_TARGET_DIRECTORIES); \
	do \
		if [ -L "$$target_directory" ]; then \
			echo "  $$target_directory: symlink ❌"; \
			exit 1; \
		elif [ -d "$$target_directory" ]; then \
			echo "  $$target_directory: real directory ✅"; \
		else \
			echo "  $$target_directory: missing"; \
		fi; \
	done

