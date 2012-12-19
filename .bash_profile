#!/bin/bash

export GIT_EDITOR="$HOME/bin/subl -w"
export EDITOR="$HOME/bin/subl -w"
export GIT_EDITOR="/usr/local/bin/mate -w"
export EDITOR="/usr/local/bin/mate -w"
export PATH=/usr/local/bin:$PATH:/usr/local/mysql/bin:~/bin:~/bin/public_scripts

export LAN_NETWORK='10.0.0'
export LOCAL_LINUX_SERVER="$LAN_NETWORK.1"
alias setvnc="ssh -p 443 -t -L 5900:localhost:5900 $LOCAL_LINUX_SERVER 'x11vnc -localhost -rfbauth \$HOME/.vnc/passwd -display :0'"
alias setvnc="ssh -p 443 -t -L 5900:localhost:5900 $LOCAL_LINUX_SERVER 'x11vnc -localhost -nopw -display :0'"

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}
 
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NOCOLOR="\[\033[m\]"

PS1="$RED\$(date +%H:%M) \w$YELLOW \$(parse_git_branch)$GREEN\$ $NOCOLOR"

export DISPLAY=:0
ps auxww | grep -q "/X " && xhost +$LAN_NETWORK.255

#if [ -f "${HOME}/.gpg-agent-info" ]; then
#	. "${HOME}/.gpg-agent-info"
#	export GPG_AGENT_INFO
#	#export SSH_AUTH_SOCK
#else
#	gpg-agent --daemon --enable-ssh-support --write-env-file "${HOME}/.gpg-agent-info"
#fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

source .bash_mdsol_profile

alias irb=pry
