#comment out to start on default tmux
#case $- in *i*)
#  [ -z "$TMUX" ] && exec tmux -2
#esac

#ls aliases
alias ls='ls --color'
alias ll='ls -l --color'
alias la='ls -a --color'

#ps aliases
#sort by cpu usage
alias pscpu='ps -e --format uid,pid,tty,%cpu,cmd --sort %cpu'
#sort by mem usage
alias psmem='ps -e --format uid,pid,tty,rss,cmd --sort rss'

#command prompt
export PS1='\[\e[96m\]\u\[\e[0m\]@\[\e[92m\]\h\[\e[0m\]:\[\e[33m\]\w\[\e[0m\]$ '

#default editor
export EDITOR='vim'
