#!/bin/bash
# ~/.bashrc

if [ -f /etc/bash/bashrc ]; then
  . /etc/bash/bashrc
fi

if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

if [ -f /etc/profile ]; then
  . /etc/profile
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

if [ -f $HOME/.dircolors ]; then
  eval $(dircolors -b $HOME/.dircolors)
fi

bash_main() {
##### Environment Variables #####
export PATH=$PATH:"${HOME}/.local/bin:/opt/bin:/usr/local/go/bin:/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin"
EDITOR=/usr/bin/vim
VISUAL=/usr/bin/vim
HISTIGNORE="&:ls:ll:top:ps -ef"
HISTCONTROL=ignoreboth:ignoredups:erasedups
HISTSIZE=10000
HISTFILESIZE=100000
HISTTIMEFORMAT='%F %T '
GLOBIGNORE=". .."
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$"\n"}history -a; history -c; history -r"

##### Aliases #####
alias ls='ls --color=auto'
alias less='less -R'
alias tmux="tmux -2"
alias today="date +%Y%m%d"
alias now="date +%Y%m%d%H%M"
alias susu="sudo -s HOME=$HOME"

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

##### Odd Shell Options #####
set -o vi
shopt -s extglob
shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend
shopt -u dotglob
shopt -s cmdhist
shopt -s histappend
umask 0022

##### Per term settings #####
case $TERM in 
  screen*)
    build_ps1
    ;;
  xterm*)
    build_ps1
    ;;
  rxvt-unicode)
    build_ps1
    ;;
  linux) 
    if [ -f /etc/vim/vimrc ]; then
      alias vim="vim -u /etc/vim/vimrc"
    fi
    TMOUT=3600
    ;;
  *)
    PS1='\h \$ '
    ;;
esac
##
}

##### Functions #####
build_ps1() {
  if [ -f ~/.ps1 ]; then
    . ~/.ps1
  elif [ -f /home/$SUDO_USER/.ps1 ]; then
    . /home/$SUDO_USER/.ps1
  else
    PS_HOST="\[\e[36;1m\]\h"
  fi
  ## Build a PS1
  if [ `whoami` == 'root' ]; then
    PS1="\[\e]0;\u@\h\a\]\[\e[34;1m\]\w\n${PS_HOST}\[\e[31;1m\] # \[\e[0m\]"
  else
    PS1="\[\e]0;\u@\h\a\]\[\e[34;1m\]\w\n${PS_HOST}\[\033[01;32m\] \$(parse_git_branch)\[\e[34;1m\]$ \[\e[0m\]"
  fi
}

pg() {
  ps -ef | grep $1
}

parse_git_branch() {
  if command -v git &> /dev/null; then
    ref=$(git symbolic-ref HEAD 2>/dev/null) || return
    echo "("${ref#refs/heads/}") "
  fi
}

get_dotfiles() {
  bash -c "$(wget -qO- https://is.gd/Pqejcq)"
}

function gdssh() {
  command ssh -Xt $1 'if command -v wget &> /dev/null; then bash -lc "$(if ! [ -d ~/.dotfiles ]; then wget -qO- "https://is.gd/Pqejcq"; fi)"; fi; bash'
}

wmip() {
  curl ifconfig.co
}

dict () {
  curl dict://dict.org/d:$1 | less
}

weather () {
  curl wttr.in/chicago
}

bash_main

if [ -f $HOME/.bashlocal ]; then
  . $HOME/.bashlocal
fi
