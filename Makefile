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
	brew bundle --file "$(PWD)/.config/homebrew/Brewfile"
	brew cleanup

## links: linking configs for zsh, tmux, vscode, nvim, alacritty.
links:
	ln -s "$(PWD)/.zshrc" ~/.zshrc
	ln -s "$(PWD)/.bash_aliases" ~/.bash_aliases
	ln -s "$(PWD)/.config/tmux/.tmux.conf" ~/.tmux.conf
	ln -s "$(PWD)/.config/nvim" ~/.config/nvim
	ln -s "$(PWD)/.config/alacritty" ~/.config/alacritty
	ln -s "$(PWD)/.config/vscode/keybindings.json" ~/Library/Application\ Support/Code/User/keybindings.json
	ln -s "$(PWD)/.config/vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json
	ln -s "$(PWD)/.config/vscode/snippets" ~/Library/Application\ Support/Code/User

## vscode: install extensions into vscode.
vscode:
	cat $(PWD)/.config/vscode/extensions.list | xargs -L1 code --install-extension
