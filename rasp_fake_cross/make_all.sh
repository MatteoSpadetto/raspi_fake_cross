#!/bin/bash

#    /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$   #
#   /$$__  $$ /$$__  $$ /$$__  $$ /$$__  $$  #
#  | $$  \ $$| $$  \__/| $$  \__/| $$  \__/  #
#  | $$$$$$$$|  $$$$$$ | $$      | $$        #
#  | $$__  $$ \____  $$| $$      | $$        #
#  | $$  | $$ /$$  \ $$| $$    $$| $$    $$  #
#  | $$  | $$|  $$$$$$/|  $$$$$$/|  $$$$$$/  #
#  |__/  |__/ \______/  \______/  \______/   #

###     Airspax Simple Cross-Compiler      ###

# Engineered by Spadetto Matteo Airspax CTO and founder

# This tools is used to design SW on a Linux Desktop PC
# to remove, copy, compile and clean c_cross dir on 
# Linux remote device
# This application is part of Airsapx Debug Tools (ADT)

# MODIFY xxx.xxx.x.xxx WITH YOUR IP ADDRESS

show_help() {
    echo "
        Usage: ./make_all.sh [-c copy] [-r rm] [-m make] [-l clean] [-h help]

        -c copy             Copy c_cross directory (storing all C files and makefile) to the device
        -r rm               Remove the entire c_cross directory permenantely
        -m make_all         Remove and copy c_cross then compile all the c_cross components and the master
        -l make_clean       Clean all the components of c_cross dir

        For Example: ./make_all.sh -m

        -h              Help
"
    exit
}

make_all() {
    ## GCC MAKE ALL
    sshpass -p "raspberry" ssh -t pi@xxx.xxx.x.xxx "cd /home/pi/c_cross/ads1115 && pwd && make"
    echo "GCC: ads1115 compiled in ads1115 executable"
    ## sshpass -p "raspberry" ssh -t pi@xxx.xxx.x.xxx "cd /home/pi/c_cross/gpio && pwd && make"
    ## echo "GCC: gpio compiled in gpio executable"
    ## ADD MORE IF NEEDED
    echo "GCC: all files succesfully compiled"
    exit
}

make_clean() {
    ## GCC MAKE CLEAN ALL
    sshpass -p "raspberry" ssh -t pi@xxx.xxx.x.xxx "cd /home/pi/c_cross/ads1115 && pwd && make clean"
    echo "GCC: ads1115 cleaned"
    #sshpass -p "raspberry" ssh -t pi@xxx.xxx.x.xxx "cd /home/pi/c_cross/gpio && pwd && make clean"
    #echo "GCC: gpio cleaned"
    ## ADD MORE IF NEEDED
    echo "GCC: all folders succesfully cleaned"
    exit
}

rm_all(){
## RM
sshpass -p "raspberry" ssh pi@xxx.xxx.x.xxx rm -r /home/pi/c_cross/
echo "RM: c_cross DIR permenantly removed from device";
}


## SCP
copy(){
sshpass -p "raspberry" scp -r ./c_cross pi@xxx.xxx.x.xxx:/home/pi/c_cross
echo "SCP: c_cross DIR copied to pi@xxx.xxx.x.xxx:/home/pi/c_cross";
}

while getopts hcmlr flag; do
    case "${flag}" in
    h) show_help ;;
    c) copy ;;
    m) rm_all && copy && make_all ;;
    l) make_clean ;;
    r) rm_all ;;
    \?)
        echo "
    Error on command and the problem can be:

        - Invalid option
        - Not correct argument error
        - Too few arguments

    Use -h flag for help
            "
        exit
        ;;
    esac
done

exit
