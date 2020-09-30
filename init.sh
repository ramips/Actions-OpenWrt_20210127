#!/bin/bash

sed -i 's/^#//g' feeds.conf.default
wget http://hk-b.npls.io/pkgs/.config

baseDir=files/etc/uci-defaults
absPath=$baseDir/xxx-init

mkdir -p $baseDir
tee $absPath <<-'EOF'
#!/bin/sh

uci set network.lan.ipaddr='192.168.123.1'
uci commit network

exit 0
EOF
chmod +x $absPath
