#!/bin/bash
# Cambia la direccion MAC en la interfaces que tengamos ...


function randomac(){
hexchars="0123456789ABCDEF"
end=$( for i in {1..10} ; do echo -n ${hexchars:$(( $RANDOM % 16 )):1} ; done | sed -e 's/\(..\)/:\1/g' )
MAC=00$end
}

#service network-manager stop
randomac
ifconfig wlan0 down
ifconfig wlan0 hw ether $MAC
ifconfig wlan0 up
echo "wlan0" $MAC

randomac
ifconfig wlan1 down
ifconfig wlan1 hw ether $MAC
ifconfig wlan1 up
echo "wlan1" $MAC

randomac
ifconfig eth0 down
ifconfig eth0 hw ether $MAC
ifconfig eth0 up
echo "eth0" $MAC
#service network-manager start
 
