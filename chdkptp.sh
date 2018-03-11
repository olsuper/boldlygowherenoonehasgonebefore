#!/bin/sh
# shell script wrapper for builds in the source tree
# chdkptp executable
# if you want separate GUI and CLI executables, make a copy that uses _gui
CHDKPTP_EXE=chdkptp
# path where chdkptp is installed
CHDKPTP_DIR="$(dirname "$(readlink -f "$0")")"
# LD_LIBRARY_PATH for shared libraries, assumed to be in lib subdir
# only needed for GUI in most cases, but should be harmless
export LD_LIBRARY_PATH="$CHDKPTP_DIR/lib"
# set lua paths, double ; appends default
export LUA_PATH="$CHDKPTP_DIR/lua/?.lua;;"
export LUA_CPATH="$CHDKPTP_DIR/?.so;;"
# required on fedora 27/wayland
export GDK_BACKEND=x11
"$CHDKPTP_DIR/$CHDKPTP_EXE" "$@"
