# CloudFlareDynamicDNS

This is a simple Bash Script which will:
1. Get your public IP address
2. Check the IP of the existing record
3. If they don't match, update the record with your new IP.

There are 4 sections you need to edit to match what you need:
record = which is the domain/subdomain you wish to have updated
auth_email = your email you sign into CloudFlare with
ZoneID = The Zone ID for your domain. You can get this from the "Overview" Section of your domain.
auth_key = Your Private Key. Found in Cloudflare > your domain > Overview > "Get your API Token" > API Token > View "Global API Key"
