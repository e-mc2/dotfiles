.PHONY: help brew brew-del
default: help

## help: show list of available commands.
help : Makefile
	@echo "+--------------------+"
	@echo "| AVAILABLE COMMANDS |"
	@echo "+--------------------+\n"
	@cat Makefile | grep "##" | sed -n 's/^## /make /p' | column -t -s ':' && echo ""

HOMEBREW := $(which brew 2>/dev/null)
brew:
ifdef HOMEBREW
	@echo Installing collected packages: Homebrew
	# curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
else
	@echo Requirement already satisfied: Homebrew
endif

brew-del:
	@echo Attempting uninstall: Homebrew
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh | bash
