startx &
picom &
wal -R &

setxkbmap -option caps:escape &
/* [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources */
startdwm
