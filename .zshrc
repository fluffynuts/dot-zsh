# .zshrc

## Modularity makes things nice.
ZSHRCDIR=~/.zsh

function optionally_source() {
  if test -f "${ZSHRCDIR}/$1"; then
    source "${ZSHRCDIR}/$1";
  fi
}

optionally_source envrc

optionally_source keys
optionally_source promptrc
optionally_source aliasrc

## Completion Control
optionally_source completionrc
optionally_source compsys

optionally_source optrc
optionally_source runrc
optionally_source runrc
optionally_source cdargs
optionally_source check-for-mail
optionally_source ssh-agent

optionally_source emerge-on-ramdisk

if test -f $ZSHRCDIR/dircolors; then
	eval $(dircolors $ZSHRCDIR/dircolors)
fi

###
### Environment
###
optionally_source lscolorsrc
COMMAND_NOT_FOUND=/etc/zsh_command_not_found
if test -e "$COMMAND_NOT_FOUND"; then
  . $COMMAND_NOT_FOUND
fi

# programming environments / tools
optionally_source nvmrc
optionally_source anaconda

unset SSH_ASKPASS
unfunction optionally_source
