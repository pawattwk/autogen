#!/bin/bash

cout=1
while [ $cout -eq 1 ]
do
read -p 'Type [ Switch ,Firewall ,Router ,Wifi-Controller(Wlc) ] ? : ' type
case $type in

[Ss]witch)
echo "Switch"
read -p 'IP for Monitoring ? > ' ip
read -p 'Pushgateway Job ? > ' job
read -p 'Community Str ? > ' com
read -p 'At every ?? Minute. > ' min
crontab -l | { cat; echo "*/$min * * * * /usr/bin/python2.7 $(pwd)/Switch.py '$ip' '$job' '$com'"; } | crontab -
echo "-----------------Suscess For Generate Script Switch-----------------"
;;
[Rr]outer)
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
[Ff]irewall)
echo "Firewall"
read -p 'IP for Monitoring ? > ' ip
read -p 'Pushgateway Job ? > ' job
read -p 'Community Str ? > ' com
read -p 'At every ?? Minute. > ' min
crontab -l | { cat; echo "*/$min * * * * /usr/bin/python2.7 $(pwd)/Firewall.py '$ip' '$job' '$com'"; } | crontab -
echo "-----------------Suscess For Generate Script Firewall-----------------"
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
