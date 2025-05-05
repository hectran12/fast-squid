#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <port> <username> <password>"
    exit 1
fi

port="$1"
username="$2"
password="$3"

echo "Đang tiến hành cài đặt..."
sudo apt update
sudo apt install -y squid apache2-utils

# create file auth
sudo htpasswd -b -c /etc/squid/passwd "$username" "$password"

# setup squid
sudo sed -i 's/http_access allow localhost/#http_access allow localhost/' /etc/squid/squid.conf
sudo sed -i 's/http_access deny all/#http_access deny all/' /etc/squid/squid.conf
sudo sed -i "s/^http_port.*/http_port $port/" /etc/squid/squid.conf

# add auth
sudo tee -a /etc/squid/squid.conf > /dev/null <<EOL

# AUTHENTICATION
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
auth_param basic realm Squid proxy-có-mật-khẩu
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
EOL

# reset service
sudo systemctl restart squid.service
sudo ufw allow $port

ip_address=$(hostname -I | awk '{print $1}')
echo "[COMPLETE] ĐÃ HOÀN TẤT QUÁ TRÌNH CÀI ĐẶT SQUID PROXY SERVER"
echo "Proxy IP Address: $ip_address"
echo "Proxy Port: $port"
echo "Username: $username"
echo "Password: $password"
