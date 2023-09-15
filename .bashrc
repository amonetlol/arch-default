#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
	. /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#Qtile
alias get_class='xprop'
alias qtest='python -m py_compile ~/.config/qtile/config.py'
alias vq='nvim ~/.config/qtile/config.py'
alias qf='cd ~/.config/qtile && ll ~/.config/qtile/'
alias qfr='cd ~/.config/qtile && ranger'
alias qlog='mousepad ~/.local/share/qtile/qtile.log &'
alias cls_qlog='clean_qtile_log'
alias qfix='sh ~/.config/qtile/fix.sh'
alias qreload='qtile cmd-obj -o cmd -f reload_config'
alias qrestart='qtile cmd-obj -o cmd -f restart'
alias qcmd='qtile cmd-obj -o layout'
alias run-app='sh ~/.config/qtile/scripts/run-app'
alias spicom='sh ~/.config/qtile/fix-picom.sh &'
alias kpi='killall picom'
alias kvm='killall vmware-vmx'
alias qreset='pkill -SIGUSR1 qtile'
alias qlay='get_qtile_layout'
alias xprop='xprop | grep "WM_CLASS"'

# --- ls --- #
alias lg="ls | grep"
alias ls='exa -lah --color=always --group-directories-first --icons'
alias ll='exa -lah --color=always --group-directories-first --icons'
alias lr='exa -R --color=always --icons --oneline'
alias lrv1='exa -R --color=always --icons --oneline --level=1'
alias lrv2='exa -R --color=always --icons --oneline --level=2'

# --- MISC --- #
alias grep='grep -i --color=auto'
alias ag='alias | grep'
alias hg='history | grep'
alias vim='nvim'
alias neovim='nvim'
alias nv='nvim'
alias cp='cp -r'
alias mkdir='mkdir -pv'
alias df2='duf'
alias cat='bat'
