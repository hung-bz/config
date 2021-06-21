HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# Bash prompt personalize
export PS1='\[\033[01;32m\]\]\u\[\033[00m\]\] \[\e[m\]\]\[\e[31m\]\]:\[\e[m\]\]\[\e[31m\]\]:\[\e[m\]\] \[\033[01;36m\]\]\w\[\033[00m\]\]\033[01;35m\]$(__git_ps1)\[\e[m\]\] \[\e[01;31m\]\]»\[\e[m\]\] '

LS_COLORS=$LS_COLORS:'di=1;36:'
export LS_COLORS

export EDITOR='vim'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias jn='jupyter notebook' 
alias bat='bat --theme="ansi" --paging=never'
alias xopen='xdg-open'

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='
    --color=hl:#dc322f,hl+:#dc322f'

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
