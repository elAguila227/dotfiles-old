#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export HISTCONTROL=ignorebpth:erasedups
export EDITOR=nvim
export BROWSER=qutebrowser

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# set vi mode in bash shell
set -o vi
bind -m vi-command 'control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

if [ -d "$HOME/.scripts/" ] ;
    then PATH="$HOME/.local/bin:$PATH"
fi

# if .scripts add to PATH
if [ -d "$HOME/.scripts/" ] ;
    then PATH="$HOME/.scripts:$PATH"
fi

# ignore upper and lowercase whrn TAB completion
bind "set completion-ignore-case on"

# dmenu pywal integration
# Import the colors
. "${HOME}/.cache/wal/colors.sh"

# Create the alias
alias dmenu='dmenu -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'
alias dmenu_run='dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'

# list
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -lA'
alias l.="ls =A | egrep '^\.'"

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
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
# run in terminal: config config --local status.showUntrackedFiles no

# vimlike
alias ",q"='exit'
