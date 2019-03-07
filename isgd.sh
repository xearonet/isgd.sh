#!/bin/bash
# Copyright (C) 2018 xearonet
# License: AGPLv3
# License URL: www.fsf.org/licensing/licenses/agpl-3.0.html

function short_url() {
	OURL="$(echo $1 | xxd -p|tr -d \\n|sed 's/../%&/g')"
	echo $OURL
	SURL=$(curl -s 'https://is.gd/create.php?format=simple&url='$OURL )
	echo $SURL
}

function short_url_with_stats() {
	OURL="$(echo $1 | xxd -p|tr -d \\n|sed 's/../%&/g')"
	SURL=$(curl -s 'https://is.gd/create.php?format=simple&logstats=1&url='$OURL )
	echo $SURL
	ID=$(echo $SURL | awk -F '/' '{print $4}' )
	if [[ -n $ID ]]; then
		STATURL='https://is.gd/stats.php?url='$ID
		echo $STATURL
	fi
}

function help_msg {
    
    echo -e "\nGive as argument an url address to short.\n\nUsage: $0 [-s] [name]\n\n-s --stats\tenable stats for link\n"
    
}

case $1 in
	"-h"|"--help") help_msg ;;
	"-s"|"--stats") short_url_with_stats $2 ;;
	*)	short_url $1 ;;
esac

# test link
# https://maps.google.co.uk/maps?f=q&source=s_q&hl=en&geocode=&q=louth&sll=53.800651,-4.064941&sspn=33.219383,38.803711&ie=UTF8&hq=&hnear=Louth,+United+Kingdom&ll=53.370272,-0.004034&spn=0.064883,0.075788&z=14

# limits is.gd

# +----------------------------------+------------------+-----------------+
# |              Action              | Limit (per hour) | Limit (per day) |
# +----------------------------------+------------------+-----------------+
# | Shortening a URL                 |              200 |           4,800 |
# | Shortening a URL with statistics |              100 |           2,400 |
# | Looking up a shortened URL       |            3,600 |          86,400 |
# | Viewing URL statistics           |               60 |           1,440 |
# +----------------------------------+------------------+-----------------+

