# Custom bin dir
PATH=$PATH":$HOME/bin"
RISCV=":$HOME/riscv"
PATH=$PATH":$RISCV/bin"

# Esc to Ctrl and Caplock
/usr/bin/setxkbmap -option 'caps:ctrl_modifier'
/usr/bin/xcape -e 'Caps_Lock=Escape' -t 100

HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Source git `prompt for PS1
source '/home/crow/.git-prompt.sh'
# Bash prompt personalize
export PS1='\[\e[01;32m\]\u\[\e[00m\] \[\e[01;31m\]::\[\e[00m\] \[\e[01;36m\]\w\[\e[00m\]\[\e[01;35m\]$(__git_ps1)\[\e[00m\] \[\e[01;31m\]»\[\e[00m\] '
export PS2='» '
shopt -s checkwinsize

# Auto cd with just dir name
shopt -s autocd

# Vi mode
set -o vi

LS_COLORS=$LS_COLORS:'di=1;36:'
export LS_COLORS

# Default editor and visual
export EDITOR='vim'
export VISUAL='vim'

# Alias
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias jn='jupyter notebook' 
alias xop='xdg-open'

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='
    --color=hl:#dc322f,hl+:#dc322f,pointer:#FF0000'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/crow/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/crow/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/crow/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/crow/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
