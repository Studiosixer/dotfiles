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

#export XDG_CONFIG_HOME="$HOME/.config"
#source /usr/share/nvm/init-nvm.sh

export EDITOR=vim
export BROWSER=lynx
#export LYNX_CFG_PATH=~/.config/lynx/

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

# Autocomplete ssh commands
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

# Autocomplete git commands
source "$HOME/.git-completion.bash"
export PATH=$HOME/bin:$PATH

# Autocomplete for aks-engine
source <(aks-engine completion)

# Use vi mode on the command line
set -o vi

HISTSIZE=1000
HISTFILESIZE=2000
