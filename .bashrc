#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\033[2;37m\][\[\033[0;32m\]\u@\h \[\033[0;34m\]\W\[\033[2;37m\]] \[\033[0;37m\]\$ '

export HISTCONTROL=ignorebpth:erasedups
export EDITOR=nvim
# export BROWSER=librewolf
export TERMINAL=st

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
if [ -d "$HOME/.cache/wal/" ] ;
    then (cat ~/.cache/wal/sequences &)
fi

# set vi mode in bash shell
set -o vi
bind -m vi-command 'control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

if [ -d "$HOME/.local/bin/" ] ;
    then PATH="$HOME/.local/bin:$PATH"
fi

# R suport on termux
if [ -d "/data/data/com.termux/files/usr/local/R-4.1.2/bin" ] ;
    then PATH="/data/data/com.termux/files/usr/local/R-4.1.2/bin:$PATH"
fi

# if .scripts add to PATH
if [ -d "$HOME/.scripts/" ] ;
    then PATH="$PATH:$HOME/.scripts"
fi

# ignore upper and lowercase whrn TAB completion
bind "set completion-ignore-case on"

# Import the colors
if [ -d "$HOME/.cache/wal/" ] ;
    then . "${HOME}/.cache/wal/colors.sh"
fi

if [ -x "$(command -v bat)" ]; then
  cless() {
    case "$1" in
      *.md) glow -s dark "$1" | less -r;;
      *) bat "$1" -p -f | less -r;;
    esac
  }
  MANPAGGER="sh -c 'col -bx | bat -l man -p'"
  alias cat='bat -p'
  alias less='cless'
fi

if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd'
else
  alias ls='ls --color=auto'
fi

# list
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lAh'
alias l.="ls -A | egrep '^\.'"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias df='df -h'

# Aliases foe software managment
alias pacman='sudo pacman --color auto'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# Config
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
# run in terminal: config config --local status.showUntrackedFiles no

# Load Angular CLI autocompletion.
source <(ng completion script 2> /dev/null)
