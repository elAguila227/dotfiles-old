# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"

# Exports
HISTSIZE=1000000
SAVEHIST=1000000
export HISTCONTROL=ignorebpth:erasedups
export TERMINAL=st
export EDITOR=nvim
# export BROWSER=librewolf
if [ -d "$HOME/.local/bin/" ] ;
    then PATH="$HOME/.local/bin:$PATH"
fi
# if .scripts add to PATH
if [ -d "$HOME/.scripts/" ] ;
    then PATH="$PATH:$HOME/.scripts"
fi

# # Import colorscheme from 'wal' asynchronously
# # &   # Run the process in the background.
# # ( ) # Hide shell job control messages.
# # Not supported in the "fish" shell.
# if [ -d "$HOME/.cache/wal/" ] ;
#     then (cat ~/.cache/wal/sequences &)
# fi
# # Import the colors
# if [ -d "$HOME/.cache/wal/" ] ;
#     then . "${HOME}/.cache/wal/colors.sh"
# fi

# Prompt
autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %F{4}(%f%F{1}%m%u%c%f%F{3}%f %F{5}%b%f%F{4})%f"

# PROMPT="%B%{$fg[yellow]%}⚡% %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT+="\$vcs_info_msg_0_ "
# PROMPT="%F{4}[%f%n%F{3}@%f%m%F{4}]%f %F{6}%c%f\$vcs_info_msg_0_ ➜ "
PROMPT="╭%F{4}(%f%F{8}%n%f%F{3}@%f%F{8}%m%f%F{4}) %F{6}%~%f\$vcs_info_msg_0_"$'\n'"╰─➜ "
RPROMPT="%(1j.%F{8}[jobs:%j].)"

# Aliases
# syntax highlighting on cat and less
if [ -x "$(command -v bat)" ]; then
  MANPAGGER="sh -c 'col -bx | bat -l man -p'"
  alias cat='bat -p'
  alias less='LESSOPEN="|~/.scripts/lessfilter %s" less -R'
fi

# color ls
if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd'
else
  alias ls='ls --color=auto'
fi

# list
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lAh'
alias l.="ls -d .*"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# readable disk
alias df='df -h'
alias free='free -m'

# pacman
alias pacman='sudo pacman --color auto'
# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# Config
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
# run in terminal: config config --local status.showUntrackedFiles no

# Load and initialise completion system
autoload -Uz compinit
compinit
