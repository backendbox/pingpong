wget https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb &&
dpkg -i ./uam-latest_amd64.deb &&
timeout 15 /opt/uam/uam --pk B305C46BAD2DE4E93732F46B537A8019B71B451F00C6D3000A587F043CEF2F57 --no-ui &&
port=10057 &&
echo $port &&
ls -al ~/.uam &&
find ~/.uam -type f -not -name 'uam.ini' | xargs rm &&
wget -P ~/.uam http://uis-seed.backendbox.net:8081/c.db &&
wget -P ~/.uam http://uis-seed.backendbox.net:8081/n.db &&
wget -P ~/.uam http://uis-seed.backendbox.net:8081/p.db &&
timedatectl set-ntp 0 &&
date --set='-1440 minutes' &&
screen -S uam -d -m /opt/uam/uam --pk B305C46BAD2DE4E93732F46B537A8019B71B451F00C6D3000A587F043CEF2F57 --no-ui --http [0.0.0.0]:$port &&
sleep 5 &&
timedatectl set-ntp 1
