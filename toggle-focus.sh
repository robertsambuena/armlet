#!/bin/bash
# Terminal short cut script

echo "Multi-app shortcut enabled."

arg=$1;

#CWH is CURRENT_WINDOW_HEX
#DWH is DESIGNATED_WINDOW_HEX

CWH=$(wmctrl -lp | grep $(xprop -root | grep _NET_ACTIVE_WINDOW | head -1 | \
    awk '{print $5}' | sed 's/,//' | sed 's/^0x/0x0/') | awk '{ print $1 }')

DWH=$(wmctrl -lx | awk "/$arg/" | awk '{print $1}')

echo "CWH $CWH";
echo "DWH $DWH";

if [ "$CWH" = "$DWH" ]
  then
    xdotool windowminimize "$DWH"
else
    echo "hex id: $DWH"
#    /usr/bin/wmctrl -ia $DWH
    xdotool windowactivate --sync $DWH
fi


