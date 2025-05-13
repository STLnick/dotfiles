# Aliases
alias gc="git checkout"
alias gcb="git checkout -b"
alias gfp="git fetch origin && git pull"
alias l="ls -alFG"
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

# Use vim motions on cli
set -o vi

addToPath() {
    if [[ ! "$PATH" == *"$1"* ]]; then
        export PATH="$PATH:$1"
    fi
}

addToPathFront() {
    if [[ ! "$PATH" == *"$1"* ]]; then
        export PATH="$1:$PATH"
    fi
}

# nvm
export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Starship prompt
eval "$(starship init zsh)"
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

addToPathFront "$HOME/.local/scripts"

