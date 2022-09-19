BREW := /opt/homebrew/bin/brew

.PHONEY: install_brew brew clean uninstall_brew uninstall_packages
default: help

## help: show list of available commands.
help : Makefile
	@echo "+--------------------+"
	@echo "| AVAILABLE COMMANDS |"
	@echo "+--------------------+\n"
	@cat Makefile | grep "##" | sed -n 's/^## /make /p' | column -t -s ':' && echo ""

## install_brew: install homebrew, packages and casks.
install_brew: | bundle clean

brew: | $(BREW)
	$(BREW) update

$(BREW):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

bundle: | brew
	$(BREW) bundle --file "$(PWD)/.config/homebrew/Brewfile"

clean:
	$(BREW) cleanup
	$(BREW) cask cleanup

uninstall_brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh | bash

uninstall_packages:
	$(BREW) remove --force --ignore-dependencies $(shell brew list)
