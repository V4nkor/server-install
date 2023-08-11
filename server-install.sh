#!/bin/bash
#Basic installation script for most widespread web services and utility packets.
#Version : 0.2
#Author : Mathieu Morgat
#Github page : https://github.com/V4nkor/server-install

currentDirectory="/opt/server-install"

#Global function

showHelp() {
	echo "Choose packages and services you wish to install using the dialog windows."
	echo "To do so use the arrow keys to navigate, use space to select / unselect and press enter to confirm"
  exit 0
}

case "${1}" in
  "-h" | "help" | "-H")
    showHelp
    ;;
esac

#Install UFW and setup basic rules for web development

#---------Initialise packets dialog------------#

	cmd=(dialog --keep-tite --separate-output --checklist "Important packets and utilities :" 22 76 16)
	options=(
		nano "nano" on
		vim "vim" off
		wget "wget" on
		curl "curl" on
		unzip "unzip" on
		git "git" on
		ufw "ufw" off
	)

#---------Store packets choices in variable---------#

	packets=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

#---------Initialise services dialog------------#

	cmd=(dialog --keep-tite --separate-output --checklist "Web services to install :" 22 76 16)
	options=(
		ssh "ssh" on
		apache2 "apache2" on
		php "php" on
		mysql "MySQL" on
		composer "Composer" on
	)

#---------Store services choices in variable---------#

	services=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

#---------Packet Functions------------

	#Install nano
	installNano(){
		printf '\e[1;31m%-6s\e[m\n' "!!Not yet implemented -> WIP!!"
	}

	#Install vim
	installVim(){
		printf '\e[1;31m%-6s\e[m\n' "!!Not yet implemented -> WIP!!"
	}

	#Install wget
	installWget(){
		printf '\e[1;31m%-6s\e[m\n' "!!Not yet implemented -> WIP!!"
	}

	#Install curl
	installCurl(){
		printf '\e[1;31m%-6s\e[m\n' "!!Not yet implemented -> WIP!!"
	}

	#Install unzip
	installUnzip(){
		printf '\e[1;31m%-6s\e[m\n' "!!Not yet implemented -> WIP!!"
	}

	#Install git
	installGit(){
		printf '\e[1;31m%-6s\e[m\n' "!!Not yet implemented -> WIP!!"
	}

	#Install ufw
	installUfw(){
		printf '\e[1;31m%-6s\e[m\n' "!!Not yet implemented -> WIP!!"
	}

#---------Processing selected packets---------#

	for packet in $packets
	do
		case $packet in
			nano)
				printf '\e[1;34m%-6s\e[m\n' "----- Installing nano -----"
				installNano ;;
			vim)
				printf '\e[1;34m%-6s\e[m\n' "----- Installing vim -----" 
				installVim ;;
			wget)
				printf '\e[1;34m%-6s\e[m\n' "----- Installing wget -----" 
				installWget ;;
			curl)
				printf '\e[1;34m%-6s\e[m\n' "----- Installing curl -----"
				installCurl ;;
			unzip)
				printf '\e[1;34m%-6s\e[m\n' "----- Installing unzip -----"
				installUnzip ;;
			git)
				printf '\e[1;34m%-6s\e[m\n' "----- Installing git -----"
				installGit ;;
			ufw)
				printf '\e[1;34m%-6s\e[m\n' "----- Installing ufw -----"
				installUfw ;;
		esac
	done

#---------Services Functions---------#

	#Install SSH functions and start service
		installSSH(){
			if (($? == 0)); then eval "apt-get install ssh -y"; fi
			if (($? == 0)); then eval "service ssh start"; fi
			OUTPUT="$(systemctl status ssh 2>&1)"
			printf "$OUTPUT \n"
		}

	#Install Apache functions and start service
		installApache(){
			if (($? == 0)); then eval "apt-get -y install apache2"; fi
			if (($? == 0)); then eval "a2enmod ssl"; fi
			if (($? == 0)); then eval "a2enmod rewrite"; fi
			if (($? == 0)); then eval "/etc/init.d/apache2 restart"; fi
			OUTPUT="$(systemctl status apache2 2>&1)"
				printf "$OUTPUT \n"
		}

	#Install PHP functions and start service
		installPHP(){
			if (($? == 0)); then eval "apt-get -y install php-common libapache2-mod-php php-cli"; fi
			if (($? == 0)); then eval "/etc/init.d/apache2 restart"; fi
			OUTPUT="$(php --version 2>&1)"
				printf "$OUTPUT \n"
		}

	#Install MySQL and setup with base options
		installMySQL(){
			#Initialise MySQL dialog
				cmd=(dialog --separate-output --checklist "MySQL configuration :" 22 76 16)
				options=(
					mysql
				)
			#Store MySQL choices in variable
				MySQL=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		}

	#Install Composer
		installComposer(){
			printf "Not yet implemented -> WIP\n"
		}

#---------Processing selected services---------#

	for service in $services
	do
		case $service in
			ssh)
				printf '\e[1;34m%-6s\e[m\n' "----- Installing SSH -----" 
				installSSH ;;
			apache)
				printf '\e[1;34m%-6s\e[m\n' "----- Installing Apache2 -----" 
				installApache ;;
			php)
				printf '\e[1;34m%-6s\e[m\n' "----- Installing PHP -----" 
				installPHP ;;
			mysql)
				printf '\e[1;34m%-6s\e[m\n' "----- Installing MySQL -----"
				printf '\e[1;31m%-6s\e[m\n' "!!Work in progress!!"
				#installMySQL 
				;;
			composer)
				printf '\e[1;34m%-6s\e[m\n' "----- Installing Composer -----"
				installComposer ;;
		esac
	done

#Exit script when finished
exit 0

# Documentation :
: <<'END_OF_DOCS'

=head1 NAME

Basic installation script for most widespread web services and utility packets.

=head1 SYNOPSIS

server-install [OPTIONS]

=head1 OPTIONS
	-h = This usage.
	-v = Be verbose.
	-V = Show version, copyright, and license information.

=head1 DESCRIPTION

A full description of the application and its features.
May include numerous subsections (i.e., =head2, =head3, etc.)

[...]

=head1 LICENSE AND COPYRIGHT

=cut

END_OF_DOCS