#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:/home/waeledui/bin

source '/home/waeledui/lib/azure-cli/az.completion'

export VIRSH_DEFAULT_CONNECT_URI=qemu:///system

export XDG_CONFIG_HOME="$HOME/.config"
source /usr/share/nvm/init-nvm.sh

source "$HOME/.homesick/repos/homeshick/homeshick.sh"