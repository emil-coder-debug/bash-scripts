#! /bin/bash
network="192.168.1.0/24"
hosts="192.168.1.0/24"
while true; do
sudo arp-scan "${hosts}" | while read -r line
host="$(echo "${line}" | awk 'print$1')
if [[ -n "${host}" ]]; then
sendemail -f "example@example.com" -u "new host is up" -m "${host} is up"
fi
done
done
