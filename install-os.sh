exit # Prevent user from acidentaly formating their os

echo "Unmounting devices..."
swapoff /mnt/swapfile
umount /mnt/boot
rm -rf /mnt/boot
cryptsetup close root
umount /mnt
umount keys
rm -rf keys

echo "Creating the gpt partition table..."
parted /dev/sda -- mklabel gpt

echo "Creating partitions..."
parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
parted /dev/sda -- set 1 boot on
parted /dev/sda -- mkpart primary 512MiB 100%
parted /dev/sda -- set 2 lvm on

echo "Creating USB key..."
#parted /dev/sdc -- mklabel gpt
#parted /dev/sdc -- mkpart primary 1Mib 100%
#mkfs.ext4 -L keys /dev/sdc1

echo "Creating key..."
dd if=/dev/urandom of=keyfile bs=512 count=4 status=progress

echo "Setting up LVM..."
cryptsetup luksFormat /dev/sda2 keyfile
cryptsetup luksOpen /dev/sda2 root --key-file keyfile

#pvcreate /dev/mapper/root
#vgcreate lvm /dev/mapper/root

#lvcreate -n root -l '100%FREE' lvm

echo "Formatting devices..."
mkfs.fat -F 32 -n boot /dev/sda1
mkfs.btrfs -L root /dev/lvm/root

echo "Setting up keyfile..."
mkdir keys
mount /dev/sdc1 keys
cp keyfile keys/
chown root keys/keyfile
chmod 400 keys/keyfile

mv keys/keyfile keys/axius

echo "Mounting the root partition..."
mount /dev/mapper/root /mnt

echo "Mounting the boot partition..."
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot

echo "Creating the 8GB swap file..."
dd if=/dev/zero of=/mnt/swap bs=1M count=8000 status=progress
chmod 600 /mnt/swap
mkswap /mnt/swap
swapon /mnt/swap

echo "Generating config..."
nixos-generate-config --root /mnt

echo "Done!"
# Run nixos-install after edditing config!
