#!/bin/bash

sed -i 's/^#//g' feeds.conf.default
wget http://hk-d.npls.io/pkgs/.config

baseDir=files/etc/uci-defaults
absPath=$baseDir/xxx-init

mkdir -p $baseDir
tee $absPath <<-'EOF'
#!/bin/sh

uci set network.lan.ipaddr='10.1.1.254'
uci set network.lan.gateway='10.1.1.1'
uci set network.lan.dns='1.2.4.8 210.2.4.8'
uci commit network
uci set wireless.default_radio0.disabled='1'
uci commit wireless

exit 0
EOF
chmod +x $absPath
