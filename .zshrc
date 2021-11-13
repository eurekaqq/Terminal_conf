# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="af-magic-modified"

plugins=(
    colored-man-pages
    command-not-found
    extract
    fzf
    sudo
    tmux
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
export EDITOR="vim"

# git typo
alias gti="git"
