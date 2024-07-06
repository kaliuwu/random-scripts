
main () {		#start main function

	echo "------------>Menu<------------"
	printf "(1) Host Discovery\n(2) Gaining Access\n(3) Denial of Service Attacks\n(4) Exit\n" #display options
	read -p "Enter Selection: " selection	#get user selection
	case $selection in	#validate selection
	1)			#if 1
  	clear
	hostdiscover
    	;;

  	2)			#if 2
    	clear
    	gainaccess
    	;;

  	3)			#if 3
    	clear
    	denial
    	;;
    	4)			#if 4
    	clear
    	echo "goodbye "		
	;;
  	*)			#if selection doesnt match options
    	echo "Invalid Selection! ! !"	
    	main
    	;;
	esac
}

hostdiscover () {	#start host discovery function
	echo "------------> Host Discovery <------------"
	echo "(1) Ping a Host"
	echo "(2) Return"
	read -p "Enter Selection: " selection	#get user input / selection
	case $selection in	

  	1)		#if 1
  	clear
	bash pingr.sh	#open ping script
    	;;
    	
  	2)		#if 2
    	clear
    	main		#return to main
    	;;

  	*)		#if invalid
    	echo "Invalid Selection! ! !"
    	hostdiscover		#return to prompt
    	;;
	esac
}
gainaccess () { 	#start gaining access function
	echo "------------> Gaining Access <------------"
	echo "(1) Connect to Linux Machine using UNREALIRCD Exploit"
	echo "(2) Gain Access to a Windows based machine using EternalBlue"
	echo "(3) Return"
	read -p "Enter Selection: " selection
	case $selection in

  	1)	#if user selects 1
  	clear
	bash exploit1.sh	#start unrealircd exploit script 
    	;;

  	2) 	#if user selects 2
  	clear
    	bash ETERNALBLUE.sh	#start eternal blue exploit
	
    	;;

  	3)	#if user selects 3
    	clear
    	main	#return to menu
    	;;

  	*)
    	echo "Invalid Selection! ! !"
    	gainaccess 		#return to prompt if invalid
    	;;
	esac
}

denial () {		#start dos function
	echo "------------> Denial of Service <------------"
	echo "(1) Windows based Denial of Service attack MS09-001"
	echo "(2) Return"
	read -p "Enter Selection: " selection #get user selection
	case $selection in

  	1) 			#if user selects 1
  	clear
	bash dosms091.sh	#start windows dos attack script
    	;;

  	2)
    	clear			#return to main
    	main
    	;;

  	*)			#if invalid selection
    	echo "Invalid Selection! ! !"
    	denial			#return to prompt
    	;;
	esac
}
echo "Welcome!"
date   #display date
main   #call main function
