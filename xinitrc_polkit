#!/bin/sh
# Make sure this is before the 'exec' command or it won't be executed.
if [[ -f "${HOME}/.startx" ]]; then
	ck-launch-session dbus-launch "${HOME}/.startx"
fi
