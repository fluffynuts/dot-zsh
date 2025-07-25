# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# .zshrc

## Modularity makes things nice.
ZSHRCDIR=~/.zsh
USE_POWERLEVEL10K=1

function optionally_source() {
  if test -f "${ZSHRCDIR}/$1"; then
    source "${ZSHRCDIR}/$1";
  fi
}
optionally_source functions
optionally_source runrc
optionally_source envrc
optionally_source keys
optionally_source promptrc
optionally_source aliasrc

## Completion Control
optionally_source completionrc
optionally_source compsys

optionally_source optrc
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
optionally_source noderc
optionally_source anaconda

unset SSH_ASKPASS
optionally_source kbrd
optionally_source p10k
unfunction optionally_source

if test -f ~/.secrets; then
  source ~/.secrets
fi

if test -d ~/.dotnet/tools; then
  export PATH="$PATH:~/.dotnet/tools"
fi

DOTBINS="$HOME/.dotbins/shell/zsh.sh"
if test -f "$DOTBINS"; then
  source "$DOTBINS"
fi

# To customize prompt, run `p10k configure` or edit ~/.zsh/p10k.
[[ ! -f ~/.zsh/p10k ]] || source ~/.zsh/p10k
