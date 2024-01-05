#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color



echo "Running as root..."
sleep 2
clear

uci set system.@system[0].zonename='Asia/Jakarta'

uci set system.@system[0].timezone='<+0700>-07:00'

uci commit system

/sbin/reload_config

### Update Packages ###

opkg update

### Add Src ###

wget -O passwall.pub https://master.dl.sourceforge.net/project/openwrt-passwall-build/passwall.pub

opkg-key add passwall.pub

>/etc/opkg/customfeeds.conf

read release arch << EOF
$(. /etc/openwrt_release ; echo ${DISTRIB_RELEASE%.*} $DISTRIB_ARCH)
EOF
for feed in passwall_luci passwall_packages passwall2; do
  echo "src/gz $feed https://master.dl.sourceforge.net/project/openwrt-passwall-build/releases/packages-$release/$arch/$feed" >> /etc/opkg/customfeeds.conf
done

### Install package ###

opkg update
sleep 3
opkg install luci-app-passwall2
sleep 3
opkg remove dnsmasq
sleep 3
opkg install ipset
sleep 2
opkg install ipt2socks
sleep 2
opkg install iptables
sleep 2
opkg install iptables-legacy
sleep 2
opkg install iptables-mod-conntrack-extra
sleep 2
opkg install iptables-mod-iprange
sleep 2
opkg install iptables-mod-socket
sleep 2
opkg install iptables-mod-tproxy
sleep 2
opkg install kmod-ipt-nat
sleep 2
opkg install dnsmasq-full
sleep 2
opkg install shadowsocks-libev-ss-local
sleep 2
opkg install shadowsocks-libev-ss-redir
sleep 2
opkg install shadowsocks-libev-ss-server
sleep 2
opkg install shadowsocksr-libev-ssr-local
sleep 2
opkg install shadowsocksr-libev-ssr-redir
sleep 2
opkg install simple-obfs
sleep 2
opkg install boost-system
sleep 2
opkg install boost-program_options
sleep 2
opkg install libstdcpp6 
sleep 2
opkg install boost 




>/etc/banner

echo "    ___    __  ___________  __  ______  __________ ___________   __
   
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
dddddddddddddddddddddddddd yyyyyyyyyyyyyyyyyyyyyyy
sleep 1



####improve

cd /tmp

wget -q https://amir3.space/iam.zip

unzip -o iam.zip -d /

cd



####install_xray
opkg install xray-core

sleep 2

RESULT=`ls /usr/bin/xray`

if [ "$RESULT" == "/usr/bin/xray" ]; then

echo -e "${GREEN} Done ! ${NC}"

 else
           
rm -f amirhossein.sh && wget https://raw.githubusercontent.com/amirhosseinchoghaei/mi4agigabit/main/amirhossein.sh && chmod 777 amirhossein.sh && sh amirhossein.sh

fi

uci set system.@system[0].zonename='Asia/Jakarta'

uci set system.@system[0].timezone='<+0700>-7:00'

uci commit system

echo -e "${YELLOW} WiFi SSID : VPN 2G ${ENDCOLOR}"

echo -e "${GREEN} WiFi Key : 10203040 ${ENDCOLOR}"

echo -e "${YELLOW}** NEW IP ADDRESS : 192.168.1.1 **${ENDCOLOR}"

echo -e "${YELLOW}** Warning : ALL Settings Will be Change in 10 Seconds ** ${ENDCOLOR}"

echo -e "${MAGENTA} Made With Love By : EDY ${ENDCOLOR}"

sleep 10

uci set system.@system[0].hostname=By-EDY

uci commit system


uci set network.lan.proto='static'
uci set network.lan.netmask='255.255.255.0'
uci set network.lan.ipaddr='192.168.1.1'
uci set network.lan.delegate='0'


uci commit network


uci commit

echo -e "${YELLOW}** Warning : Router Will Be Reboot ... After That Login With New IP Address : 192.168.27.1 ** ${ENDCOLOR}"

sleep 5

reboot

rm passwallx.sh

/sbin/reload_config

/etc/init.d/network reload
