#!/bin/sh
# 
# ~/.startx
#
# Executed by startx (run your window manager from here)
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#Permitir restart x con c+a+b
setxkbmap -option terminate:ctrl_alt_bksp

#Load .Xresources
if [[ -f "${HOME}/.Xresources" ]]; then
	xrdb -merge "${HOME}/.Xresources" &
fi

#Start urxvt as daemon
if [[ -f /usr/bin/urxvtd ]]; then
	urxvtd -q -o -f &
fi

#Set wallpaper bg
if [[ -f "${HOME}/.fehbg" ]]; then
	eval $(cat "${HOME}/.fehbg") &
fi

#Load mpd's confs
if [[ -f "${HOME}/.mpd/mpd.conf" ]]; then
	mpd "${HOME}/.mpd/mpd.conf" &
fi

#Start tint2
if [[ -f "${HOME}/.config/tint2/tint2rc" ]]; then
	(sleep 2s && tint2) &
fi

#Start conky
if [[ -f "${HOME}/.conkyrc" ]]; then
	(sleep 2s && conky) &
fi

#Load tmux sessions
if [[ -f "${HOME}/bin/tmux_init.sh" ]]; then
	(sleep 2s && tmux_init.sh) &
fi

(sleep 2s && cairo-compmgr) &

#Load .Xmodmap
if [[ -f "${HOME}/.Xmodmap" ]]; then
	(sleep 5s && xmodmap "${HOME}/.Xmodmap") &
fi

exec openbox-session
