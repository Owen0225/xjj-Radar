pkill node
cd /root/xjj-Radar/
ip=$(ifconfig | grep 'inet'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $2}')
forever start index.js sniff eth0 $ip | pino
echo "重启成功"
