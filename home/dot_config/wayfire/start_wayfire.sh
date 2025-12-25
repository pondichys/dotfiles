#!/bin/bash
# From https://github.com/WayfireWM/wf-install/blob/master/start_wayfire.sh.


# path for wf-config and wlroots
LD_LIBRARY_PATH=$LD_LIBRARY_PATH
# path is needed for wf-shell clients
PATH=$PATH
# path to find .desktop files like wcm
XDG_DATA_DIRS=$XDG_DATA_DIRS

if [ -z "$XDG_DATA_HOME" ]; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi

DEFAULT_LOG_DIR=$XDG_DATA_HOME/wayfire

if [ -z "$XDG_CONFIG_HOME" ]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [ -z "$XDG_DATA_DIRS" ]; then
    XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share"
fi
export XDG_DATA_DIRS

if [ -z "$XDG_CONFIG_DIRS" ]; then
    export XDG_CONFIG_DIRS="/etc:/etc/xdg:/usr/share"
fi

if [ -z "$XDG_CACHE_HOME" ]; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

# Start DBus session if needed
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
	if [ -z "$XDG_RUNTIME_DIR" ] || ! [ -S "$XDG_RUNTIME_DIR/bus" ] || ! [ -O "$XDG_RUNTIME_DIR/bus" ]; then
        eval "$(dbus-launch --sh-syntax --exit-with-session)" || echo "start_wayfire: error executing dbus-launch" >&2
    fi
fi

# Qt5/6
export QT_QPA_PLATFORMTHEME="lxqt"
export QT_EXCLUDE_GENERIC_BEARER=1
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# Qt6
export QT_ACCESSIBILITY=1

export MOZ_ENABLE_WAYLAND=1


mkdir -p $DEFAULT_LOG_DIR
if [ $? != 0 ]; then
    echo "Could not create log directory $DEFAULT_LOG_DIR"
    echo "Using stdout as log"
    wayfire "$@"
elif [ ! -z "$WAYLAND_DISPLAY" ] || [ ! -z "$DISPLAY" ]; then
    echo "Running nested, using stdout as log"
    wayfire "$@"
else
    LOG_FILE=$DEFAULT_LOG_DIR/wayfire.log
    if [ -f $LOG_FILE ]; then
        cp $LOG_FILE $LOG_FILE.old
    fi
    echo "Using log file: $LOG_FILE"
    wayfire "$@" &> $LOG_FILE
fi
