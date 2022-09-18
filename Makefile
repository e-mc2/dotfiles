# .PHONY: help brew brew-del
default: help

## help: show list of available commands.
help : Makefile
	@echo "+--------------------+"
	@echo "| AVAILABLE COMMANDS |"
	@echo "+--------------------+\n"
	@cat Makefile | grep "##" | sed -n 's/^## /make /p' | column -t -s ':' && echo ""

# HOMEBREW := $(which brew 2>/dev/null)
# brew:
# ifdef HOMEBREW
# 	@echo Installing Homebrew
# 	# curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
# else
# 	@echo Requirement already satisfied: Homebrew
# endif

# brew-del:
# 	@echo Attempting uninstall: Homebrew
# 	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh | bash

BREW := /usr/local/bin/brew
PACKAGE = brew list --versions $(1) > /dev/null || brew install $(1)$(2)
CASK = brew cask list $(1) > /dev/null 2>&1 || brew cask install $(1)

.PHONEY: install brew clean uninstall_brew uninstall_packages

install: | bundle clean

brew: | $(BREW)
	brew update

$(BREW):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
	eval "$(/opt/homebrew/bin/brew shellenv)"

bundle: | brew
	brew bundle --file "$(PWD)/.config/homebrew/Brewfile"

clean:
	brew cleanup
	brew cask cleanup

uninstall_brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh | bash

uninstall_packages:
	brew remove --force --ignore-dependencies $(shell brew list)

echo:
	@echo "$(PWD)/.config/homebrew/Brewfile"
