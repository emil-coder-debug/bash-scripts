hosts="192.168.1.{1..254})
nmap-result=$(nmap -iL "${hosts}" --open | grep "Nmap scan report\|tcp open")
while read -r line; do
if $(echo "${line}" | awk -F 'for' '{print$2}')
else
port=$(echo "${line}" | grep open | awk -F '/' '{print$1}')
file="port-${port}.txt"
echo "${ip} >> ${file}.txt"
fi
done <<< "${nmap-result}"
