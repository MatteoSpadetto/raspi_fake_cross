# Airspax guide for sw installation

## Raspi infos
user: pi

password: raspberry

static_ip: xxx.xxx.x.xxx

compile with:

gcc -Wall -o blink blink.c -lwiringPi -lpthread

https://www.14core.com/wp-content/uploads/2015/07/Wiring-Pi-GPIO-Diagram.png

Airspax Debug Tools (ADT):
        Airspax Simple Cross-Compiler (ASCC)

Airspax Libraries (AL):
        
## Git
Inatall git:

$ sudo apt-get install git-core

## WiringPi

Is it already installed:

$ gpio -v

If yes:

$ sudo apt-get purge wiringpi
$ hash -r

if git is not installed yet:

$ sudo apt-get install git-core

Just cause it feels good:

$ sudo apt-get update
$ sudo apt-get upgrade

download wiringPi from git with git clone or the zip file from
https://github.com/WiringPi/WiringPi.git
if not woring take it from a pc and then:
scp Downloads/WiringPi-master.zip  pi@xxx.xxx.x.xxx:/home/pi/

if zip then unzip

cd WiringPi-master
./build

Now you have WiringPi installed

To test:
gpio -v
to check each peripheral:
gpio readall

## PWM and servos

## ADC

## LASER disance sensors
