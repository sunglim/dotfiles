sudo apt-get install nfs-kernel-server

mkdir /share

vi /etc/exports

/share/ *(rw,sync,nohide,no_root_squash,insecure,subtree_check)

sudo /etc/init.d/nfs-kernel-server restart
