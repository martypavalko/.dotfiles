eval `ssh-agent -s` >/dev/null
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/usr/local/go/bin"
export ELECTRON_OZONE_PLATFORM_HINT="wayland"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
export XDG_CONFIG_FILE="$HOME/.config/"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    kubectl
    helm
    golang
)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $ZSH/oh-my-zsh.sh
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
# else
#   export EDITOR='mvim'
fi

alias vim='nvim'
alias nv='nvim'
alias airpods='bluetoothctl connect F0:5C:D5:09:37:97'
alias lg='lazygit'
alias k='kubectl'
alias h='helm'
alias kn='kubectl config set-context --current --namespace'
alias la='eza --icons -l -a'
alias ls='eza --icons -l'
alias l='eza --icons -l'
alias ll='eza --icons -l -a -T -L 2'
alias lf='yazi'

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux -f ~/.tmux.conf
# fi

#Enable Vim mode
#bindkey -v
bindkey ^R history-incremental-search-backward 
bindkey ^S history-incremental-search-forward

# source <(kubectl completion zsh)

# autoload bashcompinit && bashcompinit
# autoload -Uz compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh
