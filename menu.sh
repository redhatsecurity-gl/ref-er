#!/bin/bash




menu() {
source /home/kali/Desktop/functions.sh
clear
cat << !
	NETWORKING				SYSTEM

1) Airmon-ng Start & Airodump-ng	 update) Update	
2) Airmon-ng Stop			scansys) Scan System For Malware		
3) Aireplay-ng Deauth			sysinfo) All System Info
4) Wps Router Pin Attack	    networkinfo) All NetWork Info
5) Create Fake Access Point	  	  
6) New Random Mac-Addr			
7) Scan For Open Wifi's			
8) Scan Localnet			
9) Port Scan Target Ip		
10) Nmap Script All
11) External IP
12) DDOSS Ip Address			
setip) Set New IP Address

	OSINT					MISC		
					
13) Sms Spam Call & Text	 	   sink) Starts sync for my phone
14) Email Bomber/spam		           dict) Dictionary
15) AIO Osint Public Search		cmdloop) Command Loop X100
					snippet) Linux Code Snippets
				       findfile) AIO File Searcher
					 router) Visit Router HomePage
					 encdec) Encrypt,Decrypt A File

	WEB

  webip) Get Website IP
   http) Starts Local Web Server
sapache) Start Apache2


!
mdk3() {
source /home/kali/Desktop/functions.sh
clear
cat << !
mdk3_a) Authentication DoS mode
mdk3_d) Deauthentication / Disassociation Amok Mode
mdk3_m) Michael shutdown exploitation (TKIP)
mdk3_w) WIDS/WIPS Confusion
mdk3_f) MAC filter bruteforce mode
mdk3_g) WPA Downgrade test
!
echo ""
echo -n "[>]:(Your choice?):"
read choice
case $choice in
mdk3_a) mdk3_a ;;
mdk3_d) mdk3_d ;;
mdk3_m) mdk3_m ;;
mdk3_w) mdk3_w ;;
mdk3_f) mdk3_f ;;
mdk3_g) mdk3_g ;;
*) echo "\"$choice\" is not a valid choise"; sleep 2 ; menu ;;
esac
}


echo ""
echo -n "[>]:(Your choice?):"
read choice
case $choice in
update) update ;;
scansys) scansys ;;
sapache) sapache ;;
1) airstart; airodump ;;
2) airstop ;;
3) deauth ;;
4) wps_att ;;
5) fake_ap ;;
6) newmac ;;
7) openwifi ;;
8) snet ;;
9) portscan ;;
10) nmap_all ;;
11) extip ;;
12) ddoss1 ;;
13) sms_spam ;;
14) email_spam ;;
15) aiosint ;;
webip) getwebip ;;
dict) dict ;;
cmdloop) cmdloop ;;
mdk3) mdk3 ;;
sink) start_syncthing ;;
snippet) code_snippets ;;
sysinfo) allsystem_info ;;
http) startwebserver ;;
networkinfo) listallnetwork ;;
findfile) find_file_by_words_findfile_by_name ;;
router) router ;;
encdec) encrypt_decrypt ;;
setip) setip ;;
*) echo "\"$choice\" is not a valid choise"; sleep 2 ; menu ;;
esac
}

