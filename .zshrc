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

# Ruby installed via brew
if [[ "$OS" == "Mac" ]]; then
    export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
    export GOROOT=$(brew --prefix go)/libexec
    export ANSIBLE_COLLECTIONS_PATH=/opt/homebrew/Cellar/ansible/13.0.0/libexec/lib/python3.14/site-packages/ansible_collections
fi

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH

if [ -f "$(which rbenv)" ]; then
    export PATH="$HOME/.rbenv/shims:$PATH"
    eval "$(rbenv init - zsh)"
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

if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    source $ZSH/oh-my-zsh.sh
fi

# Enable Vim mode (must be after oh-my-zsh source)
bindkey -v
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Needed for `watch {command}` usage
alias watch='watch '

if [ -f "$(which nvim)" ]; then
    export EDITOR='nvim'
    alias vi='nvim'
    alias vim='nvim'
    alias nv='nvim'
fi

alias lg='lazygit'
alias k='kubectl'
alias h='helm'
alias kn='kubectl config set-context --current --namespace'
alias kc='kubectx'
if [ -f "$(which eza)" ]; then
alias l='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first'
alias ll='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -l --git -h'
alias la='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a'
alias lla='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a -l --git -h'
fi
if [ -f "$(which yazi)" ]; then
alias lf='yazi'
fi
# Load Angular CLI autocompletion.
alias ngcomplete='source <(ng completion script)'
alias notify-me='ntfy pub martypavalko '
alias ssh='TERM=screen ssh '

if [ -f ~/.zshrc.secret ]; then
    source ~/.zshrc.secret
fi

yt() {
    local video_link="$1"
    fabric -y "$video_link" --transcript
}

aws_profile_picker() {
    if [[ -z $TMUX ]]; then
        export AWS_PROFILE=$(rg '^\[profile (.+)\]' ~/.aws/config --replace '$1' --no-filename | fzf --reverse)
    else
        local tmpfile=$(mktemp)
        tmux display-popup -E "rg '^\[profile (.+)\]' ~/.aws/config --replace '\$1' --no-filename | fzf --reverse > $tmpfile"
        local selected_profile=$(cat "$tmpfile")
        rm -f "$tmpfile"
        if [[ -n $selected_profile ]]; then
            export AWS_PROFILE=$selected_profile
        fi
    fi
}

alias ap=aws_profile_picker

if [ -f "$(which zoxide)" ]; then
    eval "$(zoxide init zsh)"
fi

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/mpavalko/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


