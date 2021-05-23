startx &
picom &

setxkbmap -option caps:escape &
/* [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources */

wal -R &

startdwm
