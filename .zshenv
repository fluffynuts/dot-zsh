#
# Example .zshenv file for zsh 4.0
#
# .zshenv is sourced on all invocations of the
# shell, unless the -f option is set.  It should
# contain commands to set the command search path,
# plus other important environment variables.
# .zshenv should not contain commands that product
# output or assume the shell is attached to a tty.
#
export X11HOME=/usr/X11R6

path=($path $X11HOME/bin)
path=($path /bin /usr/bin /usr/sbin /sbin /bin)
path=($path /usr/local/bin)
path=($path /home/$USER/apps/scripts)
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

if test -e ~/.rvm/scripts/rvm; then
  source ~/.rvm/scripts/rvm
  export PATH="$PATH:$HOME/.rvm/bin"
fi
