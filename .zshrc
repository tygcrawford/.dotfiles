# Check for ~/.oh-my-zsh/ and if it doesnt exist run the install script
[[ -x $HOME/.oh-my-zsh ]] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Additions to PATH
export PATH=$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="common"

# Add java home
JAVA_HOME="/usr/bin/java"


# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR="nvim"

## aliases
# use nvim
alias vim=nvim

# eza aliases
alias ls="eza -G"
alias la="eza -la --git --icons --group-directories-first"
alias lt="eza -aTL 2 --icons"

# man search
alias sman="man \$(compgen -c | fzf)"
alias stldr="tldr \$(compgen -c | fzf)"

neofetch
