# securitygodsforgiveme
Bits and pieces so that you can get passwordless root logins onto GCE servers.  

#how-to:
okay folks, this one is nothing fancy.  Just do like such
1. fork this repo
2.  'git clone https://github.com/faddat/securitygodsforgiveme'
3.  'cat ~/.ssh/id_rsa.pub'
4.  copy your ssh key into the clipboard (there's a comand just for this and it's handy but it's late and I cannot remember the name)
5.  'nano securitygodsforgiveme/startup.sh'
6.  paste your ssh key where I've put a bunch of bold text explaining that ssh keys placed here will get passwordless ssh access, making sure that you first delete all of the bold text "BETWEEN THE QUOTATION MARKS"
7.  'gcloud auth login'  (blah, blah....)
* If you don't have a bucket set up, you set one up like this:
gsutil mb gs://fuckyeahchicken/  (or whatever)
8.  gsutil cp startup.sh gs://*bucketnamehere*/startup.sh  sshd_config gs://*bucketnamehere*/sshd_config
9.  Okay, now go to console.developers.google.com and either make a single neuternode by setting up an instance with gs://*bucketnamehere*/startup.sh as the startup script.  Right now this will only work with debian-based OSES.  

# use cases
* Passwordless SSH
* Following digitalocean directions
* completing myriad tasks that do not assume that you're working in Google's cloud
* Ansible
* using an instance group to make yourself 10 identical micro instances and then using paralell ssh to manipulate them all in the same way
* ......and many, many more to come!

# raison d'etre:
Google's cloud is FREAKING GREAT.  I love the management interface, I love the power, to say I am blown away by the sheer coolness of what they've assembled would be putting it very lightly.  This said, there were too many situations when I needed to access my resources in Gcloud without using the 'gcloud compute salsfkj;lasfjoagh" commands.  In order to do what I needed, I just needed to be root, pop in, and pop back out.  This lets you do that very quickly.  


