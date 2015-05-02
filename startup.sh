#! /bin/bash
rm /etc/ssh/sshd_config
apt-get update
apt-get upgrade -y
apt-get install -y git
gcloud components update -q

mkdir /root/.ssh
chmod 700 /root/.ssh
ssh-keygen -q -N '' -f /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub

gsutil cp gs://fuckyeahchicken/sshd_config /etc/ssh/sshd_config
printf "WHATEVER SSH KEY YOU PUT HERE BETWEEN THESE QUOTATION MARKS 
WILL HAVE PASSWORDLESS ROOT LOGIN" > 
/root/.ssh/authorized_keys
sudo service ssh restart
print "okay all done"
