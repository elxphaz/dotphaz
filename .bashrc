#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias dotfiles=/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME

PATH="$HOME/.envm/nodejs/node-v20.11.0-linux-x64/bin:$PATH"

# pnpm
export PNPM_HOME="/home/eliphaz/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
