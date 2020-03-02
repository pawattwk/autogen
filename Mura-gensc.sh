#!/bin/bash

cout=1
while [ $cout -eq 1 ]
do
read -p 'Type [ Switch ,Firewall ,Router ,Wifi-Controller(Wlc) ] ,VM-Linux(vm01) ,VM-Window(vm02) ? : ' type
case $type in

[Ss]witch | [Ss])
echo "Switch"
read -p 'IP for Monitoring ? > ' ip
read -p 'Pushgateway Job ? > ' job
read -p 'Community Str ? > ' com
read -p 'At every ?? Minute. > ' min
crontab -l | { cat; echo "*/$min * * * * /usr/bin/python2.7 $(pwd)/Switch.py '$ip' '$job' '$com'"; } | crontab -
echo "-----------------Suscess For Generate Script Switch-----------------"
;;
[Rr]outer | [Rr])
echo "Router"
read -p 'IP for Monitoring ? > ' ip
read -p 'Pushgateway Job ? > ' job
read -p 'Community Str ? > ' com
read -p 'At every ?? Minute. > ' min
crontab -l | { cat; echo "*/$min * * * * /usr/bin/python2.7 $(pwd)/Router.py '$ip' '$job' '$com'"; } | crontab -  
echo "-----------------Suscess For Generate Script Router-----------------"
;;
[Ww]lc |[Ww]ificontroller)
echo "Wifi-controller"
read -p 'IP for Monitoring ? > ' ip
read -p 'Pushgateway Job ? > ' job
read -p 'Community Str ? > ' com
read -p 'At every ?? Minute. > ' min
crontab -l | { cat; echo "*/$min * * * * /usr/bin/python2.7 $(pwd)/Wifi-Controller.py '$ip' '$job' '$com'"; } | crontab -
echo "-----------------Suscess For Generate Script Wifi-controller-----------------"  
;;
[Ff]irewall | [Ff])
echo "Firewall"
read -p 'IP for Monitoring ? > ' ip
read -p 'Pushgateway Job ? > ' job
read -p 'Community Str ? > ' com
read -p 'At every ?? Minute. > ' min
crontab -l | { cat; echo "*/$min * * * * /usr/bin/python2.7 $(pwd)/Firewall.py '$ip' '$job' '$com'"; } | crontab -
echo "-----------------Suscess For Generate Script Firewall-----------------"
;;
[Vv]m02 | [Vv]m-window)
echo "VM-Window"
read -p 'IP for Monitoring ? > ' ip
read -p 'Pushgateway Job ? > ' job
read -p 'Community Str ? > ' com
read -p 'At every ?? Minute. > ' min
crontab -l | { cat; echo "*/$min * * * * /usr/bin/python2.7 $(pwd)/vm-window.py '$ip' '$job' '$com'"; } | crontab -
echo "-----------------Suscess For Generate Script VM-Widow-----------------"
;;
[Vv]m01 | [Vv]m-linux)
echo "VM-Linux"
read -p 'IP for Monitoring ? > ' ip
read -p 'Pushgateway Job ? > ' job
read -p 'Community Str ? > ' com
read -p 'At every ?? Minute. > ' min
crontab -l | { cat; echo "*/$min * * * * /usr/bin/python2.7 $(pwd)/vm-linux.py '$ip' '$job' '$com'"; } | crontab -
echo "-----------------Suscess For Generate Script VM-Linux-----------------"
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
