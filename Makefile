.DEFAULT_GOAL := help

STOW := stow

CONFIG_TARGET := $(HOME)/.config
HOME_TARGET := $(HOME)

CONFIG_PACKAGES := fish starship tmux wezterm
HOME_PACKAGES := home

.PHONY: dry-run
dry-run: ## Preview changes without creating or deleting symlinks.
	@mkdir --parents "$(CONFIG_TARGET)"
	@mkdir --parents "$(HOME_TARGET)/.local"
	@mkdir --parents "$(HOME_TARGET)/.bashrc.d"
	$(STOW) --no --verbose --restow --target="$(CONFIG_TARGET)" $(CONFIG_PACKAGES)
	$(STOW) --no --verbose --restow --target="$(HOME_TARGET)" $(HOME_PACKAGES)

.PHONY: install
install: ## Install or update all managed dotfiles.
	@mkdir --parents "$(CONFIG_TARGET)"
	@mkdir --parents "$(HOME_TARGET)/.local"
	@mkdir --parents "$(HOME_TARGET)/.bashrc.d"
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

