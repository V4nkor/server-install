#!/bin/bash
#Script d'installation customisée de serveur LAMP

#---------Global Functions------------

#Install SSH functions and start service
installSSH(){
	eval "apt install ssh -y"
	eval "service ssh start"
	OUTPUT="$(systemctl status ssh 2>&1)"
	printf "$OUTPUT \n"
}

#Install Apache functions and start service
installApache(){
	eval "apt-get -y install apache2"
	eval "a2enmod ssl"
	eval "a2enmod rewrite"
	eval "/etc/init.d/apache2 restart"
	OUTPUT="$(systemctl status apache2 2>&1)"
        printf "$OUTPUT \n"
}

#Install PHP functions and start service
installPHP(){
	eval "apt-get install php-common libapache2-mod-php php-cli"
	eval "/etc/init.d/apache2 restart"
	printf "WIP"
}

#Install MySQL and setup with base options
installPHP(){
	printf "WIP"
}

#Install GIT
installGIT(){
	printf "WIP"
}

#Install UFW and setup basic rules for web development

#---------Initialise dialog------------

cmd=(dialog --separate-output --checklist "Services to install:" 22 76 16)
options=(
	1 "SSH" on
	2 "Apache" on
	3 "PHP" off
	4 "MySQL" off
	5 "GIT" off
	6 "UFW" off
)

#Store choices in variable
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear

#Processing selected options
for choice in $choices
do
	case $choice in
		1)
			echo "Installing SSH" 
			installSSH ;;
		2)
			echo "Installing Apache" 
			installApache ;;
		3)
			echo "Installing PHP" 
			installPHP ;;
		4)
			echo "Installing MySQL"
			installMySQL ;;
		5)
			echo "Installing GIT"
			installGIT ;;
		6)
			echo "Installing UFW"
			installUFW ;;
	esac
done

#Exit script when finished
exit 0
