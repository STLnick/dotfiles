# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs vi_mode)
# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

plugins=(
	git
	zsh-autosuggestions
	zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# ---

# Aliases
alias gc="git checkout"
alias gcb="git checkout -b"
alias gfp="git fetch origin && git pull"
alias l="ls -al"
alias v="nvim"
alias cpf="sudo ncat --sh-exec \"ncat platform-local.curate.co 5173\" -l 443 --keep-open"
alias awsconfig="v ~/.aws/credentials"
alias nvimconfig="v ~/.config/nvim"
alias zshconfig="v ~/.zshrc"

# Autojump Plugin
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

function notes() {
    nvim ~/Documents/work/notes
}

function today() {
    nvim ~/Documents/work/notes/$(date -I).md
}

function yesterday() {
    yesterday=$(date -v-1d +"%Y-%m-%d")
    nvim ~/Documents/work/notes/${yesterday}.md
}

# nvm
export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
