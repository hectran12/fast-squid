#!/bin/bash

if [ "$#" -ne 1 ]; then
    exit 1
fi

echo "Đang tiến hành cài đặt..."
port="$1"
sudo apt update
sudo apt install -y squid
ip_address=$(hostname -I)
sudo sed -i 's/http_access allow localhost/#http_access allow localhost/' /etc/squid/squid.conf
sudo sed -i 's/http_access deny all/http_access allow all/' /etc/squid/squid.conf
sudo sed -i "s/http_port 3128/http_port $port/" /etc/squid/squid.conf
sudo systemctl restart squid.service
sudo ufw allow $port
echo "[COMPLETE] ĐÃ HOÀN TẤT QUÁ TRÌNH CÀI ĐẶT SQUID PROXY SERVER"
echo "Proxy IP Address: $ip_address"
echo "Proxy Port: $port"
