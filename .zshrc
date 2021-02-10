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

export PATH="/Users/eurekaqq/.arc/arcanist/bin/:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eurekaqq/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/eurekaqq/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/eurekaqq/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/eurekaqq/.google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/Cellar/python@3.8/3.8.6_1/bin:$PATH"

# gcloud command
alias gssh="gcloud compute ssh"
