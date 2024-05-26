#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/usr/local/go/bin"
export ELECTRON_OZONE_PLATFORM_HINT="wayland"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

#ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

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

alias discord='discord --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto'
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux -f ~/.tmux.conf
# fi

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#zprof

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Enable Vim mode
#bindkey -v
bindkey ^R history-incremental-search-backward 
bindkey ^S history-incremental-search-forward

eval "$(starship init zsh)"
