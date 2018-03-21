alias chkMath='bash ~/coding/randomProgramming/chkMath/chk.sh' 
alias pSrv='~/coding/randomProgramming/cmdln_py/pop_up_srv.py'
alias tabula='java -Dfile.encoding=utf-8 -Xms256M -Xmx1024M -jar ~/tabula/tabula.jar'
alias printers='systemctl start org.cups.cupsd.service'
alias giut='git status --porcelain | grep "?" | cut -c4- >> $(git rev-parse --show-toplevel)/.gitignore'

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
