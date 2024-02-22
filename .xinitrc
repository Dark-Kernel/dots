setxkbmap us &
setxkbmap -option caps:ctrl_modifier 
picom -fb 
xsetroot -cursor_name left_ptr
sxhkd & > /dev/null 2>&1
bash .local/bin/dwmbg 
xset r rate 300 50 &
exec dunst &



### Dwm ###########################################
~/.local/bin/dwm-status &
#bash .local/bin/dwmbg 
#exec dbus-launch --exit-with-session dwm

### Bspwm #########################################
#bash ~/.config/polybar/launch.sh --hack
#bash .config/polybar/launch.sh --shades &
#status-time &
#slstatus &

### Audio driver #################################
#pulseaudio --start &
#mpDris2 & 
#pipewire & 

### Others ######################################
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & 
#/usr/lib/kdeconnectd & 

### Wm's ##########################################
#exec qtile start
#exec dwm 
exec dbus-launch --sh-syntax --exit-with-session dwm
#gentoo-pipewire-launcher & 
#exec awesome
#exec bspwm 
#exec xmonad
