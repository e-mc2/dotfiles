This is my steps to install tools and staff on MacOS from scratch.

1. Install the CLI tools for Xcode:

```bash
xcode-select —-install
```

2. Install [Homebrew](https://brew.sh/):
```bash
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
```
> &ensp;Make sure you follow *Next steps* in the end of Homebrew's instruction

&emsp;&emsp;Then run `Makefile` to install brew packages, casks and macs with command:

```bash
make bundle
```

3. Use Zsh from Homebrew instead of MacOs's Zsh [link](https://cyishere.medium.com/update-zsh-on-macos-f9de96373a43):

```bash
# add `zsh` to the system /etc/shells
sudo echo '/usr/local/bin/zsh' >> /etc/shells

# use the next command line to change shell
chsh -s /usr/local/bin/zsh

# confirm whether it has changed
dscl . -read /Users/$USERNAME UserShell
UserShell: /usr/local/bin/zsh
```

4. Install [Oh-my-zsh](https://ohmyz.sh/) and plugins:

```bash
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
```
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
```

5. Link configs for `zsh`, `tmux`, `vscode`, `nvim` and `alacritty`, install extensions for vscode

```bash
make links
make vscode
```

6. Move this files and folders manually from other computers:

```
.aws
.ssh
.zsh_history
pgp keys
```
