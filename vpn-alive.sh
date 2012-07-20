#!/bin/sh
[ -f $1 ] && rm $1

for host in `ssh root@repo.welltime.ru 'cat /etc/openvpn/ccd/* | cut -f2 -d\ '`; do 
	ping -c1 -W1 $host > /dev/null && host $host | grep vpn | cut -f5 -d' ' | sed 's/\.$//g' >> $1 &
done
