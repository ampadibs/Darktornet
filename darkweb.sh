#/bin/bash
sudo apt install lolcat -y && sudo apt install figlet -y && sudo apt install torsocks
sudo service tor start
clear
count=1
while [ $count = 1 ]; do
	figlet "TOR ENGINE" | lolcat
	echo "1   :   Search engine" | lolcat
	echo "2   :   onion site" | lolcat
	read -p "select 1 or 2 : " machine
	if [ $machine -eq 1 ];then
		url="http://xmh57jrknzkhv6y3ls3ubitzfqnkrwxhopf5aygthi7d6rplyvk3noyd.onion/cgi-bin/omega/omega?P="
		read -p "what do you want to check :- " name
		new=$(echo $name|tr ' ' '+')
		new_url=($url$new)
		sudo torsocks wget -q -O - $new_url |  grep -oP 'http[s]?://[^"]+' | sort -u
	elif [ $machine -eq 2 ]; then
		read -p "Enter the onion url : " onionurl
		sudo torsocks wget -q -O - $onionurl
	else
		echo "Invalid selection"
	fi
	read -p "did you want to continue (1,0) : " inp
	if [ $inp -eq 1 ];then
		echo ok
		clear
	else
		words="THANK YOU FOR USING OUR SCRIPT"
		for word in $words;do
			for n in $word;do
				echo -n $n | lolcat
				sleep 1
				echo -n " "
			done
		done
		count=0
	fi
done
