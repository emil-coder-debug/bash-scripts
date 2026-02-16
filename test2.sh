#!/bin/bash
port=80

read -r -p "Type a target IP: " ip_adress
read -r -p "Type a target port: " port
if [[ -z "${ip_adress}" ]]; then
   echo "please type valid ip"
   exit 1
fi

if [[ -z "${port}" ]]; then
   port=80
   echo "type a valid port , default port =80"
fi

curl_result=$(curl -s --head "http://${ip_adress}:${port}" | grep Server | awk -F ':' '{print$2}' )

if [[ -z "${curl_result}" ]]; then

echo "${ip_adress}'s header is empty"

else

echo "server header for ${ip_adress} on port ${port} is : ${curl_result}"

fi
