#!/bin/bash
#Uninstaller for server-install.sh
#Version : 0.2
#Author : Mathieu Morgat
#Github page : https://github.com/V4nkor/server-install

currentDirectory="/opt/server-install"

#Purge php
printf '\e[1;34m%-6s\e[m\n' "----- Removing php -----"
sudo apt purge php-common libapache2-mod-php php-cli

#Purge Apache 2 and it's directories
printf '\e[1;34m%-6s\e[m\n' "----- Removing apache2 -----"
sudo apt purge apache2 apache2-utils
printf '\e[1;34m%-6s\e[m\n' "Removing directories"
sudo rm -R /usr/sbin/apache2
sudo rm -R /usr/lib/apache2
sudo rm -R /etc/apache2
sudo rm -R /usr/share/apache2 

#Remove all dependencies
printf '\e[1;34m%-6s\e[m\n' "----- Removing dependencies -----"
sudo apt-get autoremove

#Delete installation file
printf '\e[1;34m%-6s\e[m\n' "----- Deleting main script -----"
cd $currentDirectory
if (($? == 0)); then sudo rm server-install.sh ; fi

#Delete itself after everything else was uninstalled
printf '\e[1;34m%-6s\e[m\n' "----- Self deleting uninstaller -----"
sudo rm -- "$0"

# Documentation :
: <<'END_OF_DOCS'

=head1 NAME

Uninstaller for server-install.sh

=head1 SYNOPSIS

server-install [OPTIONS]

=head1 DESCRIPTION

A full description of the application and its features.
May include numerous subsections (i.e., =head2, =head3, etc.)

[...]

=head1 LICENSE AND COPYRIGHT

This script is under a GNU V 3.0 licence.

You are free to :

-Use this script
-Modify it to satisfy your use case
-Redistribute this script
-Share any modification made

Mathieu Morgat - 2023

=cut

END_OF_DOCS