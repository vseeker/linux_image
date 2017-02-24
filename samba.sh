apt-get update
apt-get install git
git clone https://github.com/vseeker/linux_tools.git
cd linux_tools/
sh apt_resource_change.sh
apt-get -y install samba
apt-get -y install smbclient
passwd=r00tme && (echo $passwd;echo $passwd) | smbpasswd -a  root

echo "[python27]
   comment = python
   path = /usr/lib/python2.7/dist-packages
   guest ok = no
   browseable = yes
   writable = yes
   create mask = 0755
   directory mask = 0755
[dashboard]
   comment = dashboard
   path = /usr/share/openstack-dashboard
   guest ok = no
   browseable = yes
   writable = yes
   create mask = 0755
   directory mask = 0755" >> /etc/samba/smb.conf


iptables -A INPUT -ptcp --dport 445 -j ACCEPT
iptables -A INPUT -ptcp --dport 140 -j ACCEPT
