alias chkMath='bash ~/coding/randomProgramming/chkMath/chk.sh' 
alias pSrv='~/coding/randomProgramming/cmdln_py/pop_up_srv.py'
alias tabula='java -Dfile.encoding=utf-8 -Xms256M -Xmx1024M -jar ~/tabula/tabula.jar'
alias printers='systemctl start org.cups.cupsd.service'
alias giut='git status --porcelain | grep "?" | cut -c4- >> $(git rev-parse --show-toplevel)/.gitignore'
alias shruggie='echo "¯\_(ツ)_/¯" | xclip -in -selection clipboard'

calc(){
    bc -l <<< "$@"
}

# gg(){
#     git add -A
#     git commit -m "On `date`: $1"
#     git push
# }

alias l='ls'
export WWW_HOME="http://www.google.com"
export TERMINAL=xterm
export GOPATH="$HOME/go"

al () {
    alias | grep "$1"
}

set_brt () {
    echo "$1" |sudo tee /sys/class/backlight/intel_backlight/brightness
}

eval $(thefuck --alias ugh)

vim () {
    VIM_SESSION_DIR="$HOME/.vim/sessions/"
    VIM_SESSION_FILE="$VIM_SESSION_DIR${PWD//\//.}.vim"

    if test $# -gt 0; then
        env vim "$@"
    elif test -f $VIM_SESSION_FILE; then
        env vim -c "source $VIM_SESSION_FILE"
    else
        env vim -c "Obsession $VIM_SESSION_FILE"
    fi

}
