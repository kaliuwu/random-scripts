echo "your IP Address is "; hostname -I | awk '{print $1}'			#show host / local ip
read -p "ENTER IP ADDRESS TO PING: " ip						        #ask user for ip to ping
ping -c 5 $ip > /dev/null && echo "The Ping Request to $ip WAS successful" || echo "The Ping Request to $ip was NOT Successful" 
#ping the target ip display output based on ping response
