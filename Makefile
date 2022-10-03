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
	mkdir -p ~/.config
	ln -sf "$(PWD)/.zshrc" ~/.zshrc
	ln -sf "$(PWD)/.bash_aliases" ~/.bash_aliases
	ln -sf "$(PWD)/.config/tmux/.tmux.conf" ~/.tmux.conf
	ln -sfn "$(PWD)/.config/nvim" ~/.config/nvim
	ln -sfn "$(PWD)/.config/alacritty" ~/.config/alacritty
	ln -sf "$(PWD)/.config/vscode/keybindings.json" ~/Library/Application\ Support/Code/User/keybindings.json
	ln -sf "$(PWD)/.config/vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json
	ln -sf "$(PWD)/.config/vscode/snippets" ~/Library/Application\ Support/Code/User

## vscode: install extensions into vscode.
vscode:
	cat $(PWD)/.config/vscode/extensions.list | xargs -L1 code --install-extension
