#!/usr/bin/env bash

layouts=(
  "[]=,Tile"
  "><>,Floating"
  "[M],Monocle"
  "TTT,BStack"
  "===,BStackHoriz"
  "|M|,CenteredMaster"
  ">M>,CenteredFloatingMaster"
  "|||,Columns"
  "[D],Deck"
  "(@),Fibonacci_Spiral"
  "[\\],Fibonacci_Dwindle"
  "HHH,Gridmode"
  "---,HorizGrid"
  ":::,GapplessGrid"
  "###,NRowGrid"
)

# JGMENU
c=0
CSV=""
for layout in ${layouts[*]}; do
  if [ ! -z "$(grep -i "${layout#*,}_LAYOUT 1" $HOME/.config/suckless/dwm/patches.h)" ] || [ "${layout#*,}" = "Floating" ]; then
    layout=${layout//</&lt;}
    layout=${layout//>/&gt;}
    CSV=$CSV$(echo "${layout%%,*},$c\n")
    (( c++ ))
  fi
done

echo -e $CSV | jgmenu --simple --icon-size=0 --at-pointer --no-spawn


# # ROFI
# theme='
# configuration {
#   yoffset:45;
#   xoffset:70;
#   kb-accept-entry: "Return,KP_Enter,space,o";
#   kb-row-left: "h";
#   kb-row-right: "l";
#   kb-row-up: "Up,k";
#   kb-row-down: "Down,j";
#   kb-cancel: "Escape,q";
#   show-icons: false;
#   hover-select: true;
# }
# #listview {
#   border: 0px;
#   padding: 0px;
#   scrollbar: false;
# }
# #inputbar {
#   enabled:false;
# }
# #window {
#   location:northwest;
# }
# '
#
# c=0
# w=0
# CSV=""
# for layout in ${layouts[*]}; do
#   if [ ! -z "$(grep -i "${layout#*,}_LAYOUT 1" $HOME/.config/suckless/dwm/patches.h)" ] || [ "${layout#*,}" = "Floating" ]; then
#     CSV=$CSV$(echo "${layout%%,*}\n")
#     s=${#layout}
#     if [ $s -gt $w ]; then w=$((s + 2)); fi
#     (( c++ ))
#   fi
# done
#
# echo -e "$CSV" | rofi -theme-str "$theme #window{width:4ch;}" -dmenu -format i -l $c
