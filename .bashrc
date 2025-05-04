fastfetch
# enable color support for ls and other commands
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vi='nvim'
alias vim='nvim'
alias l='ls -lah'

export LIBVIRT_DEFAULT_URI="qemu:///system"

p!() {
    local last_cmd=$(history 2 | head -n1 | sed 's/^\s*[0-9]*\s*//')
    
    local new_cmd=${last_cmd/pacman/yay}
    
    echo "Executing: $new_cmd"
    eval "$new_cmd"
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
