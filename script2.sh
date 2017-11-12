interface=$(dmesg  |grep "link becomes ready"|cut -d: -f3|tr -d " "|tail -1)
ip=$(tcpdump -c 1 -i $interface arp 2>&1 |grep "Request.*169.254"|sed 's/^.*tell //g'|cut -d"," -f1)
echo $ip
ifconfig $interface 169.254.7.7
ssh pi@$ip
