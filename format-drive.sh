exit

parted /dev/sde -- mkpart primary 1MiB 100%
sudo parted /dev/sde -- set 1 lvm on

sudo cryptsetup luksFormat /dev/sde1
sudo cryptsetup luksOpen /dev/sde1 red_portable-storage-a01
sudo mkfs.btrfs -L red_portable-storage-a01 /dev/mapper/red_portable-storage-a01

# Raid0
# sudo mkfs.btrfs -d raid0 -L red_cold-storage-a01 /dev/mapper/red_cold-storage-a01-1 /dev/mapper/red_cold-storage-a01-2
