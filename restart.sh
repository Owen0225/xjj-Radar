killall node
ip=$(ifconfig | grep 'inet'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $2}')
cd xjj-Radar/
forever start index.js sniff eth0 $ip | pino
echo "重启成功"
