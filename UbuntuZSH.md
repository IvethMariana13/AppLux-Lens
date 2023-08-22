# Ubuntu ZSH

Ubuntu ZSH + Powerlevel10K + Plugins

## Z Shell (ZSH)
The Z shell (Zsh) is a Unix shell that can be used as an interactive login shell and as a command interpreter for shell scripting. Zsh is an extended Bourne shell with many improvements, including some features of Bash, ksh, and tcsh.

To install it, together with the PowerLine Glyphs icons, run:
```bash
sudo apt install -y zsh fonts-powerline
```

* Assuming that a Nerd Font is already installed and configured: https://www.nerdfonts.com/font-downloads


## Oh-My-ZSH
🙃 A delightful community-driven (with 2,000+ contributors) framework for managing zsh configuration It includes 300+ optional plugins (rails, git, macOS, hub, docker, homebrew, node, php, python, etc), 140+ themes to spice up your morning, and an auto-update tool so that makes it easy to keep up with the latest updates from the community.

To install it, run:
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


## PowerLevel10K
For the main theme, we will use PowerLevel10K from https://github.com/romkatv/powerlevel10k. Powerlevel10k is a theme for ZSH. It emphasizes speed, flexibility and out-of-the-box experience. Installation is very quick by running:
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

We need to edit the ZSH config file to state that we want to use Oh-My-ZSH by replacing the values of `ZSH_THEME="robbyrussell"`:
```bash
nano ~/.zshrc
```

```java
ZSH_THEME="powerlevel10k/powerlevel10k"
```

We will need then to configure ZSH to use this theme by running:
```bash
p10k configure
```

* Go through the wizard and choose your preferred options

In order to suppress the warning and make our login process quicker, we will add this to the configuration file, which is located in `~/.p10k.zsh`, and change the value `verbose` for `quiet`:
```bash
nano ~/.p10k.zsh
```

```yaml
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
```


## Oh-My-ZSH Plugins
Oh-My-Zsh comes bundled with plugins, which allow to take advantage of functionality of many sorts to the shell just by enabling them. Enable a plugin by adding its name to the plugins array in the .zshrc file (found in the $HOME directory). For example, this enables the rails, git and ruby plugins, in that order:
```yaml
plugins=(rails git ruby)
```

Some of them need to be installed with `curl` for the plugin into the respective config file with one command. Our preferred ones from this list: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
1) ZSH Auto-Suggestions: As you type, you’ll see a suggested completion come up in a faded gray color
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
2) sudo: this plugin takes what you just typed and adds a `sudo` at the beginning for you. The shortcut is to hit the escape key twice.
3) copyfile: copy the contents of a file to the clipboard
4) jsontools: this plugin has a number of neat capabilities, but I mainly use it to pretty print json. Just pipe your call with `| pp_json`
5) git: this plugin provides many aliases and a few useful functions
6) aws: this plugin provides completion support for awscli and a few utilities to manage AWS profiles and display them in the prompt
7) helm: this plugin adds completion for Helm, the Kubernetes package manager
8) kubectl: this plugin adds completion for the Kubernetes cluster manager, as well as some aliases for common kubectl commands
9) kubectx: this plugins adds kubectx_prompt_info() function. It shows name of the active kubectl context (kubectl config current-context)
10) nmap: this plugin adds some useful aliases for Nmap similar to the profiles in zenmap
11) ubuntu: this plugin adds completions and aliases for Ubuntu

So, in our case, we would add these ones:
```bash
nano ~/.zshrc
```

```yaml
plugins=(git zsh-autosuggestions sudo copyfile jsontools aws helm kubectl kubectx nmap ubuntu)
```


## Neofetch
Neofetch is a command-line system information tool written in bash 3.2+. Neofetch displays information about your operating system, software and hardware in an aesthetic and visually pleasing way.

The information by default is displayed alongside your operating system's logo. You can further configure Neofetch to instead use an image, a custom ASCII file, your wallpaper or nothing at all.

To install it, run:
```bash
sudo apt install -y neofetch
```

We can edit the values in the config file, per example, adding local and public IP and disk usage:
```bash
nano ${HOME}/.config/neofetch/config.conf
```

We could also add the current weather temperature by adding this line to the config file:
```bash
prin "Weather" "$(curl wttr.in/?0?q?T | awk '/°(C|F)/ {printf $(NF-1) $(NF) " ("a")"} /,/ {a=$0}')"
```

For it all to work, we need to edit the `~/.zshrc` to add the binary `neofetch`.


## Make ZSH your default
We can set ZSH or BASH are our default by using these commands:
```bash
chsh -s $(which zsh)
chsh -s $(which bash)
```
