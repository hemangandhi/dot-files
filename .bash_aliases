alias chkMath='bash ~/coding/randomProgramming/chkMath/chk.sh' 
alias pSrv='~/coding/randomProgramming/cmdln_py/pop_up_srv.py'
alias tabula='java -Dfile.encoding=utf-8 -Xms256M -Xmx1024M -jar ~/tabula/tabula.jar'
alias printers='systemctl start org.cups.cupsd.service'

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

al () {
    alias | grep "$1"
}

rng () {
    if [ -z $RANGER_LEVEL ]; then
        ranger
    else
        exit
    fi
}
