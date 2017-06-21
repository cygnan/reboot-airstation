#!/bin/sh
routerIp='192.168.11.1'
userName='root'
password=''
export LANG=ja_JP.UTF-8
secret=`echo -n "${userName}:${password}" | openssl enc -base64`
for i in `seq 6`; do
res=`echo -ne "GET /cgi-bin/cgi?req=frm&frm=init.html HTTP/1.0\r\nHost: ${routerIp}\r\nAuthorization: Basic ${secret}" | nc ${routerIp} 80`
sleep 1
num=`echo -n ${res} | sed -e 's/^.*sWebSessionnum\ value=\([0-9\-]*\)>.*$/\1/'`
id=`echo -n ${res} | sed -e 's/^.*sWebSessionid\ value=\([0-9\-]*\)>.*$/\1/'`
[ "${num}" != "`echo -n ${num} | sed -e 's/\([^0-9\-]\)//g'`" -o "${num}" = '' ] && echo 'Failed...' && continue
data="reboot=%3d%22%e5%86%8d%e8%b5%b7%e5%8b%95&sWebSessionnum=${num}&sWebSessionid=${id}"
dataLen=`echo -n ${data} | wc -c`
echo -ne "POST /cgi-bin/cgi?req=inp&res=waiting_page.html HTTP/1.0\r\nHost: ${routerIp}\r\nContent-Type: application/x-www-form-urlencoded\r\nContent-Length: ${dataLen}\r\nAuthorization: Basic ${secret}\r\n\r\n${data}" | nc ${routerIp} 80 > /dev/null && echo 'Successfully sent a HTTP POST request.' && break || echo 'Failed...'
sleep 3
done
