#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

source /home/arturosasan/.config/broot/launcher/bash/br

# Created by `pipx` on 2026-04-06 16:59:01
export PATH="$PATH:/home/arturosasan/.local/bin"
