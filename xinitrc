#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/usr/local/lib/X11/xinit/.Xresources
sysmodmap=/usr/local/lib/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

LANG=ja_JP.eucJP
export LANG

twm &
emiclock -geometry -1+1 && xclock -geometry 50x50-1+1 &
xterm -geometry 80x40+494+51 &
xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x46+0+0 -name login
