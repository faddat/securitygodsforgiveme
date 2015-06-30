#! /bin/bash
rm /etc/ssh/sshd_config
apt-get install -y openssh-server openssh-client
rm /etc/ssh/sshd_config
sed -i 's/wheezy/sid/g' /etc/apt/sources.list
apt-get update
apt-get dist-upgrade -y
apt-get install -y git mosh curl
curl -sSL https://get.docker.com/ | sh
curl -sL https://deb.nodesource.com/setup_0.12 | bash -
echo "deb http://cran.rstudio.com/bin/linux/debian sid-cran3/" | tee -a /etc/apt/sources.list
echo "deb http://deb.torproject.org/torproject.org sid main" | tee -a /etc/apt/sources.list
apt-get install -y build-essential git graphicsmagick imagemagick nodejs gccgo mosh fish rustc haskell-platform sudo python3 python-pip php5 mysql-server sqlite apache2 clang maven
apt-get dist-upgrade -y
pip install docker-compose
gcloud components update -q

mkdir /root/.ssh
chmod 700 /root/.ssh
ssh-keygen -q -N '' -f /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub

sshd_config='/etc/ssh/sshd_config'

sudo mv $sshd_config $sshd_config.bak
sudo rm -f $sshd_config

echo "# SSH Config
Port 22
Protocol 2
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_dsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key
UsePrivilegeSeparation yes
KeyRegenerationInterval 3600
ServerKeyBits 1024
SyslogFacility AUTH
LogLevel INFO
LoginGraceTime 120
PermitRootLogin without-password
StrictModes yes
RSAAuthentication yes
PubkeyAuthentication yes
IgnoreRhosts yes
RhostsRSAAuthentication no
HostbasedAuthentication no
PermitEmptyPasswords no
ChallengeResponseAuthentication no
X11Forwarding yes
X11DisplayOffset 10
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
AcceptEnv LANG LC_*
UsePAM yes
Subsystem sftp internal-sftp
Match group ftpaccess
ChrootDirectory %h
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp
" | sudo tee $sshd_config

printf "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCqHUGoqYnhwEI/8rQvh55+kVhGubVKONHcdR6QTv/RGTvneGwf6yTSx+mDWjITjWj7gNg3S+//U4SCtICUR/tN9SffZziZlfScBTGXW2gagOfLjX/ww/D6mGNMv5RT9Msk1zYoBK3/F5bfnwYGCQOvSgwbyWFDM2LZxYLuNGGMVT3y7Z95GT6dP1tKP21+6m47gBwppe2eMErpYWuZtDXY8FlHCxSPh4HH1PuHpo4f7STHXJIdrdN7aRjRB8yziCZ7mucWV+XxDhqpgyf13KznQRALnn5lMF84+h97nqVNrhKwZNuiOnCzk6JNYiUtjrpYFpt1UnCNKMtE0UEpzF5d7lyulS16cvfY3Vjl8hJ+lR5/KCqeyr/ObKGS4wyyFMm5+JjAOuwXijT+bDUVyT8WJIPqON9njHVxq9qyQ+LOurMLSCCRhdr6Sfv8vq1mWkXJixgtXy2nXpyAEKtCxWddWgLnWJS9QhFmdmdS9BR2ZxJZiLU/BdGtoM8etyraM6SbWm7870twr1BdL/RLCi14GfEIn4J4KGnsGi6nMVUPVCoiOWTy2E/2xcaO/weezMkjXsstp0xJa0r9n9PRkf64zqbzA4d4T3YYm9c6meiwFiofXTZFpYbXHuC1MSTZQ9/4u2CnrlDqBqHFIK23tINhFtSaGihfLtziFf0+iVdVrw== faddat@gmail.com" > 
/root/.ssh/authorized_keys
sudo service ssh restart
print "okay all done"
