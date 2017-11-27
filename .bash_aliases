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

wifi () {
    ps ax | grep dhcpcd | head -1 | grep wlp3s0
    if [ 0 -ne $? ]; then
        sudo wpa_supplicant -B -i wlp3s0 -c ~/ru.conf
        sudo wpa_cli status | grep "COMPLETED"
        while [ $? -ne 0 ]; do
            sudo wpa_cli status
            date
            sleep 2;
            sudo wpa_cli status | grep "COMPLETED"
        done
        sudo dhcpcd wlp3s0
    fi

    sudo wpa_cli status | grep "COMPLETED"
    while [ $? -ne 0 ]; do
        sudo wpa_cli status
        date
        sleep 2;
        sudo wpa_cli status | grep "COMPLETED"
    done

    ping www.google.com
    while [ $? -ne 0 ]; do
        date
        sleep 2;
        ping www.google.com
    done
}
