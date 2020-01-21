#!/bin/bash

cout=1
while [ $cout -eq 1 ]
do
read -p 'Type [ Switch ,VM ,Router ,Wifi-Controller(Wlc) ] ? : ' type
case $type in

[Ss]witch|[Ss])
echo "Switch"
read -p 'IP for Monitoring ? > ' ip
read -p 'Community Str ? > ' com
read -p 'At every ?? Minute. > ' min
crontab -l | { cat; echo "*/$min * * * * /usr/bin/python2.7 $(pwd)/Switch.py '$ip' '$com'"; } | crontab -
echo "-----------------Suscess For Generate Script Switch-----------------"
;;
[Rr]outer|[Rr])
echo "Router"
read -p 'IP for Monitoring ? > ' ip
read -p 'Community Str ? > ' com
read -p 'At every ?? Minute. > ' min
crontab -l | { cat; echo "*/$min * * * * /usr/bin/python2.7 $(pwd)/Router.py '$ip' '$com'"; } | crontab -  
echo "-----------------Suscess For Generate Script Router-----------------"
;;
[Ww]lc |[Ww]ificontroller)
echo "Wifi-controller"
read -p 'IP for Monitoring ? > ' ip
read -p 'Community Str ? > ' com
read -p 'At every ?? Minute. > ' min
crontab -l | { cat; echo "*/$min * * * * /usr/bin/python2.7 $(pwd)/Wifi-Controller.py '$ip' '$com'"; } | crontab -
echo "-----------------Suscess For Generate Script Wifi-controller-----------------"  
;;
[Vv][Mm])
echo "VM"
read -p 'IP for Monitoring ? > ' ip
read -p 'Community Str ? > ' com
read -p 'At every ?? Minute. > ' min
crontab -l | { cat; echo "*/$min * * * * /usr/bin/python2.7 $(pwd)/vm.py '$ip' '$com'"; } | crontab -
echo "-----------------Suscess For Generate Script VM-----------------"
;;
"")
read -p " Do you want to Exit ?? [Y/N] " response
if [[ "$response" =~ ^([yY]|"")$ ]]
then
cout=2
echo "---Exit---"
else
cout=1
echo "---Continus---"
fi
;;
*)
echo "!!! No Type in Case !!!"
echo "Please specify the correct type."
;;

esac
done
