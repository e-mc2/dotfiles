current_folder := $(abspath $(PWD))

.PHONEY: bundle links vscode
default: help

## help: show list of available commands.
help : Makefile
	@echo "+--------------------+"
	@echo "| AVAILABLE COMMANDS |"
	@echo "+--------------------+\n"
	@cat Makefile | grep "##" | sed -n 's/^## /make /p' | column -t -s ':' && echo ""

## bundle: install homebrew's packages, casks and macs.
bundle:
	brew tap homebrew/cask-fonts
	brew bundle --file $(current_folder)/.config/homebrew/Brewfile
	brew cleanup

## links: linking configs for zsh, tmux, vscode, nvim, alacritty.
links:
	mkdir -p ~/.config
	ln -sf $(current_folder)/.zshrc ~/.zshrc
	ln -sf $(current_folder)/.bash_aliases ~/.bash_aliases
	ln -sf $(current_folder)/.config/tmux/.tmux.conf ~/.tmux.conf
	ln -sfn $(current_folder)/.config/nvim ~/.config/nvim
	ln -sfn $(current_folder)/.config/alacritty ~/.config/alacritty
	ln -sf $(current_folder)/.config/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	ln -sf $(current_folder)/.config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
	ln -sfn $(current_folder)/.config/vscode/snippets ~/Library/Application\ Support/Code/User/snippets

## vscode: install extensions into vscode.
vscode:
	cat $(current_folder)/.config/vscode/extensions.list | xargs -L1 code --install-extension
