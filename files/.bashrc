# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth
HISTCONTROL=ignoredups:erasedups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

# Save and reload the history after each command finishes
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
  PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00;32m\] \$(__git_ps1 ' (%s)')\$(parse_git_dirty)"
else
  PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w \$(__git_ps1 ' (%s)')\$(parse_git_dirty)"
fi

PS1="\[\033[00;37m\]$PS1 \[\033[00;35m\]\[\033[00;00m\]\n$ "

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
      PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
      ;;
  *)
  ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alFg'
alias la='ls -Ag'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# $HOME/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f $HOME/.bash_aliases ]; then
  . $HOME/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

######################################################################
#                              helpers                               #
######################################################################

function parse_git_dirty {
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

#
# .NET Core Telemetry
# -------------------
# The .NET Core tools collect usage data in order to improve your experience. The data is anonymous and does not include command-line arguments.
# The data is collected by Microsoft and shared with the community.
# You can opt out of telemetry by setting a DOTNET_CLI_TELEMETRY_OPTOUT environment variable to 1 using your favorite shell.
# You can read more about .NET Core tools telemetry @ https://aka.ms/dotnet-cli-telemetry.
#
# no M$ spies please!
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# See http://mislav.uniqpath.com/2013/01/understanding-binstubs/ for details
PATH="./bin:./script:$PATH"

# finally, export path variable
export PATH=$PATH
