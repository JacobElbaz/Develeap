#!/bin/bash
echo "root:escaperoom" | chpasswd
echo "escape:escape" | chpasswd
apt-get update
apt-get install -y apt-utils vim sudo cowsay man
sudo adduser escape sudo

chmod -R agou+rw escapeRoom/room_1
chmod -R agou+rw escapeRoom/room_2/
useradd -M -s /bin/false white_rabbit
usermod -u 521 white_rabbit
chmod -R agou+rw escapeRoom/room_3/
chmod -R agou-x escapeRoom/room_3/creature.sh
chmod -R agou+rw escapeRoom/room_4/
chmod -R agou+rw escapeRoom/room_4/crazyText
chmod -R agou+rw escapeRoom/room_5/
chmod -R agou+x escapeRoom/room_5/PhoenixFire.jar
chmod -R agou+rw escapeRoom/room_6/
chmod -R agou+rw escapeRoom/room_7/
useradd -M -s /bin/bash testUser
chmod -R agou+rw escapeRoom/room_8/
chmod -R agou+rw escapeRoom/room_9/
