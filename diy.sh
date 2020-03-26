#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.31.200/g' package/base-files/files/bin/config_generate
wget -O package/base-files/files/etc/hosts https://raw.githubusercontent.com/chenxiccc/Customfiles/master/hosts
wget -O tmp/dhcp.tmp https://raw.githubusercontent.com/chenxiccc/Customfiles/master/x86/dhcp
cat tmp/dhcp.tmp >> package/network/services/dnsmasq/files/dhcp.conf
rm tmp/dhcp.tmp
wget -O tmp/firewall.tmp https://raw.githubusercontent.com/chenxiccc/Customfiles/master/x86/firewall
cat tmp/firewall.tmp >> package/network/config/firewall/files/firewall.config
rm tmp/firewall.tmp
wget -O feeds/lienol/lienol/luci-app-passwall/root/usr/share/passwall/rules/blacklist_host_host https://raw.githubusercontent.com/chenxiccc/Customfiles/master/pw/blacklist_host
wget -O feeds/lienol/lienol/luci-app-passwall/root/usr/share/passwall/rules/whitelist_host https://raw.githubusercontent.com/chenxiccc/Customfiles/master/pw/whitelist_host
wget -O feeds/lienol/lienol/luci-app-passwall/root/usr/share/passwall/rules/blacklist_ip https://raw.githubusercontent.com/chenxiccc/Customfiles/master/pw/blacklist_ip
wget -O feeds/lienol/lienol/luci-app-passwall/root/usr/share/passwall/rules/whitelist_ip https://raw.githubusercontent.com/chenxiccc/Customfiles/master/pw/whitelist_ip
#Nps 添加断线自动重连
#wget -O package/lean/luci-app-nps/luasrc/model/cbi/nps.lua https://raw.githubusercontent.com/chenxiccc/openwrt/dev-19.07/package/lean/luci-app-nps/luasrc/model/cbi/nps.lua
#wget -O package/lean/luci-app-nps/root/etc/config/nps https://raw.githubusercontent.com/chenxiccc/openwrt/dev-19.07/package/lean/luci-app-nps/root/etc/config/nps
#wget -O package/lean/luci-app-nps/root/etc/init.d/nps https://raw.githubusercontent.com/chenxiccc/openwrt/dev-19.07/package/lean/luci-app-nps/root/etc/init.d/nps
#wget -O package/lean/luci-app-nps/luasrc/i18n/nps.zh_CN.po https://raw.githubusercontent.com/chenxiccc/openwrt/dev-19.07/package/lean/luci-app-nps/luasrc/i18n/nps.zh_CN.po
#npslatest=$(curl --silent "https://api.github.com/repos/ehang-io/nps/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | sed 's/v//g')
#npslatest=$(curl --silent "https://api.github.com/repos/ehang-io/nps/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/v//g')
#sed -i "s/PKG_VERSION:=0.26.5/PKG_VERSION:=0.26.6/g" package/lean/npc/Makefile
