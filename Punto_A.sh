#!/bin/bash
sudo fdisk /dev/sdb <<EOM
n
p
1

+512M
t
82
w
EOM
sudo mkswap /dev/sdb1
sudo swapon /dev/sdb1
sudo fdisk /dev/sdb <<EOM
n
p
2


t
2
8e
w
EOM
sudo fdisk /dev/sdc <<EOM
n
p
1


t
8e
w
EOM
sudo pvcreate /dev/sdb2 /dev/sdc1
sudo vgcreate vg_datos /dev/sdb2 /dev/sdc1
sudo lvcreate -L 10M -n lv_docker vg_datos
sudo lvcreate -L 1.5G -n lv_multimedia vg_datos
sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_multimedia
sudo mkdir -p /var/lib/docker/
sudo mkdir -p /Multimedia/
sudo mount /dev/vg_datos/lv_docker /var/lib/docker/
sudo mount /dev/vg_datos/lv_multimedia /Multimedia/
sudo systemctl restart docker
sudo systemctl status docker
