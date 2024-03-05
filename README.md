<b>Repo này tạo ra giúp bạn tạo proxy IPV4 nhanh hơn</b>
<hr>
<pre>
  curl -o install.sh https://raw.githubusercontent.com/hectran12/fast-squid/main/install.sh && chmod +x install.sh && ./install.sh {port do bạn tự đặt}
</pre>
<br>
<b>Ví dụ: </b><br>
<pre>
  curl -o install.sh https://raw.githubusercontent.com/hectran12/fast-squid/main/install.sh && chmod +x install.sh && ./install.sh 6969
</pre>
<br>
<p>Sau khi nhập vui lòng đợi một lúc cho nó cài đặt và bạn sẽ nhận được ip với port và sau đó sử dụng như bình thường!</p>
<br>
<b>Lệnh test kiểm tra proxy có hoạt động hay không</b>
<pre>
  curl -x {ip}:{port} http://kiemtraip.com/raw.php
</pre>
