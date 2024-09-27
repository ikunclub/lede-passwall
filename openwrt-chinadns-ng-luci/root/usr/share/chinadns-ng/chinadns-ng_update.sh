#!/bin/sh -e
set -o pipefail

[ -d /etc/chinadns-ng ] || mkdir /etc/chinadns-ng
wget https://ispip.clang.cn/all_cn.txt -O /tmp/chnroute.txt.tmp
mv -f /tmp/chnroute.txt.tmp /etc/chinadns-ng/chnroute.txt
wget https://ispip.clang.cn/all_cn_ipv6.txt -O /tmp/chnroute-v6.txt.tmp
mv -f /tmp/chnroute-v6.txt.tmp /etc/chinadns-ng/chnroute6.txt
wget https://fastly.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/gfw.txt -O /tmp/gfwlist.txt.tmp
mv -f /tmp/gfwlist.txt.tmp /etc/chinadns-ng/gfwlist.txt
wget https://pexcn.me/daily/chinalist/chinalist.txt -O /tmp/chinalist.txt.tmp
mv -f /tmp/chinalist.txt.tmp /etc/chinadns-ng/chinalist.txt

/etc/init.d/chinadns-ng restart
