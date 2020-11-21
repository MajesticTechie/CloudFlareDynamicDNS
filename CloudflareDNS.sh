#!/bin/bash

## Set your Custom Stuff Here
record="subdomain.mydomain.com"
auth_email="MyEmail@myemail.com"
ZoneID="kjsdhfjksadhfkjasdf"
auth_key="akjlsdflkasjdfl;kjasl;kdfjlk;a"

## Gets your public IP and current record on domain using an external resolver
CurrentDNS=`dig +short $record @1.1.1.1`
MyIp=`dig +short myip.opendns.com @resolver1.opendns.com`

## Checks if the record matches existing IP
if [ "$CurrentDNS" != "$MyIp" ]; then
## Gets Record ID
record_identifier=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$ZoneID/dns_records?name=$record" -H "X-Auth-Email: $auth_email" -H "X-Auth-Key: $auth_key" -H "Content-Type: application/json"  | grep -Po '(?<="id":")[^"]*')
## Pushes new IP to record
curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$ZoneID/dns_records/$record_identifier" -H "X-Auth-Email: $auth_email" -H "X-Auth-Key: $auth_key" -H "Content-Type: application/json" --data "{\"id\":\"$ZoneID\",\"type\":\"A\",\"name\":\"$record\",\"content\":\"$MyIp\"}"
fi
