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
printf "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCqHUGoqYnhwEI/8rQvh55+kVhGubVKONHcdR6QTv/RGTvneGwf6yTSx+mDWjITjWj7gNg3S+//U4SCtICUR/tN9SffZziZlfScBTGXW2gagOfLjX/ww/D6mGNMv5RT9Msk1zYoBK3/F5bfnwYGCQOvSgwbyWFDM2LZxYLuNGGMVT3y7Z95GT6dP1tKP21+6m47gBwppe2eMErpYWuZtDXY8FlHCxSPh4HH1PuHpo4f7STHXJIdrdN7aRjRB8yziCZ7mucWV+XxDhqpgyf13KznQRALnn5lMF84+h97nqVNrhKwZNuiOnCzk6JNYiUtjrpYFpt1UnCNKMtE0UEpzF5d7lyulS16cvfY3Vjl8hJ+lR5/KCqeyr/ObKGS4wyyFMm5+JjAOuwXijT+bDUVyT8WJIPqON9njHVxq9qyQ+LOurMLSCCRhdr6Sfv8vq1mWkXJixgtXy2nXpyAEKtCxWddWgLnWJS9QhFmdmdS9BR2ZxJZiLU/BdGtoM8etyraM6SbWm7870twr1BdL/RLCi14GfEIn4J4KGnsGi6nMVUPVCoiOWTy2E/2xcaO/weezMkjXsstp0xJa0r9n9PRkf64zqbzA4d4T3YYm9c6meiwFiofXTZFpYbXHuC1MSTZQ9/4u2CnrlDqBqHFIK23tINhFtSaGihfLtziFf0+iVdVrw== faddat@gmail.com" > 
/root/.ssh/authorized_keys
sudo service ssh restart
print "okay all done"
