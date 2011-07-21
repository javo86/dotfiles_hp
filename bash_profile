#set ft=sh
# ~/.bash_profile

# ENV VARS
# {{{

# Make grep moar colorful
export GREP_COLOR="1;33"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && export LESSOPEN="|/usr/bin/lesspipe.sh %s"

# Custom PATH
# {{{
if [[ -d "${HOME}/bin" ]]; then
	export PATH=$PATH:"${HOME}/bin"
fi
# }}}

# TERM settings
# {{{
#Set term & color term
TERM="rxvt-unicode"
COLORTERM="rxvt-unicode-256color"
# }}}

# BROWSER settings
# {{{
if [[ -n "${DISPLAY}" ]]; then
	BROWSER=firefox
else
	BROWSER=elinks
fi
# }}}

# HIST settings
# {{{
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# }}}

# }}}
if [[ ! $DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec startx
  # Could use xinit instead of startx
  #exec xinit -- /usr/bin/X -nolisten tcp vt7
fi
 
