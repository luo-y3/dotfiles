# Activate the THEME
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/powerlevel10k/powerlevel10k.zsh-theme

export ZSH="$HOME/oh-my-zsh"

# Call the THEME
ZSH_THEME="powerlevel10k/powerlevel10k"


# Fix case sensitive
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


# Tools
eval "$(zoxide init zsh)"

# Short command
alias ls="eza --icons"
alias ll="eza --icons -l"
alias la="eza --icons -la"
alias update="sudo pacman -Syu"
alias vi="nvim"
alias cls="clear"
alias q="exit"

# PECO function
function peco-select-history() {
  BUFFER=$(fc -l -n 1 | tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-ghq-cd() {
  local selected_dir=$(ghq list -p | peco) 
  if [ -n "$selected_dir" ]; then
    echo "\033[32m-> Jumped to $selected_dir\033[0m"
    ls
  fi
}
zle -N peco-ghq-cd
bindkey '^f' peco-ghq-cd

# Plugins Auto-suggestion n Syntax hightlight
plugins=(git)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Load config powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
