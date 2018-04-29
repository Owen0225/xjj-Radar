#!/bin/bash
echo "欢迎使用小姐姐一键搭建"
ip=$(ifconfig | grep 'inet'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $2}')
echo $ip
read -p "回车后开始安装"
chmod +x ssrmu.sh
./ssrmu.sh 2>&1 | tee shadowsocks-all.log

echo "ssr搭建成，请记住连接信息"
read -p "记住了吗？任意键继续" 

curl https://raw.githubusercontent.com/creationix/nvm/v0.13.1/install.sh | bash
source ~/.bash_profile
nvm install v9.8.0
nvm alias default v9.8.0
yum -y install gcc-c++
yum -y install flex
yum -y install bison
wget http://www.tcpdump.org/release/libpcap-1.8.1.tar.gz
tar -zxvf libpcap-1.8.1.tar.gz
cd libpcap-1.8.1
./configure
make
make install

cd ~
git clone https://gitee.com/Object0225/xjj-Radar.git
cd xjj-Radar/
npm i
npm i -g pino
npm install -g forever
forever start index.js sniff eth0 $ip | pino

echo "搭建完成"
