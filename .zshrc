# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="af-magic-modified"

plugins=(
	git 
	zsh-z 
	extract 
	zsh-autosuggestions 
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export PATH="/Users/eurekaqq/.arc/arcanist/bin/:$PATH"
export EDITOR="vim"

alias gadd="git status --short | fzf --multi --color=dark --cycle --border --ansi --preview-window=up:70% --preview=\"git diff --color {+2}\" | awk '{print \$2}'  | xargs git add"

export FZF_CTRL_R_OPTS="--select-1 --exit-0 --reverse"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eurekaqq/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/eurekaqq/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/eurekaqq/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/eurekaqq/.google-cloud-sdk/completion.zsh.inc'; fi
