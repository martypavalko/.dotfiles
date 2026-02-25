# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
eval `ssh-agent -s` >/dev/null

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/Users/mpavalko/.lmstudio/bin"
export PATH="$PATH:/home/marty/.dotnet/tools"

case `uname` in
  Darwin)
    OS="Mac"
  ;;
  Linux)
    OS="Linux"
  ;;
esac

# Needed on WSL
# export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"

export ELECTRON_OZONE_PLATFORM_HINT="wayland"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export XDG_CONFIG_FILE="$HOME/.config/"
export XDG_CONFIG_HOME="$HOME/.config/"

# Golang environment variables
if [[ "$OS" == "Mac" ]]; then
  export GOROOT=$(brew --prefix go)/libexec
fi
# export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH

if [[ "$OS" == "Mac" ]]; then
  export ANSIBLE_COLLECTIONS_PATH=/opt/homebrew/Cellar/ansible/13.0.0/libexec/lib/python3.14/site-packages/ansible_collections
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    kubectl
    helm
    docker
    golang
    aws
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
)

export NVM_DIR="$HOME/.config//nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

source $ZSH/oh-my-zsh.sh
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
# else
#   export EDITOR='mvim'
fi


# Needed for `watch {command}` usage
alias watch='watch '

alias rss='newsboat'

alias vi='nvim'
alias vim='nvim'
alias nv='nvim'
alias lg='lazygit'
alias k='kubectl'
alias h='helm'
alias kn='kubectl config set-context --current --namespace'
alias kc='kubectx'
alias l='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first'
alias ll='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -l --git -h'
alias la='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a'
alias lla='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a -l --git -h'
alias lf='yazi'
alias ap='AWS_PROFILE='
alias priority='vim ~/work/platform.wiki/priorities.md'
# Load Angular CLI autocompletion.
alias ngcomplete='source <(ng completion script)'
alias notify-me='ntfy pub martypavalko '

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux -f ~/.tmux.conf
# fi

#Enable Vim mode
bindkey -v
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

# Loop through all files in the ~/.config/fabric/patterns directory
# for pattern_file in $HOME/.config/fabric/patterns/*; do
#     # Get the base name of the file (i.e., remove the directory path)
#     pattern_name=$(basename "$pattern_file")
#
#     # Create an alias in the form: alias pattern_name="fabric --pattern pattern_name"
#     alias_command="alias $pattern_name='fabric --pattern $pattern_name'"
#
#     # Evaluate the alias command to add it to the current shell
#     eval "$alias_command"
# done

if [ -z ~/.zshrc.secret ]; then
  source ~/.zshrc.secret
fi

yt() {
    local video_link="$1"
    fabric -y "$video_link" --transcript
}

# source <(kubectl completion zsh)

# autoload bashcompinit && bashcompinit
# autoload -Uz compinit && compinit
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/mpavalko/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


