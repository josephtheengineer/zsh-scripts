#source /etc/zsh/use-key.sh

# /etc/zsh/mount-drive.sh -esd /dev/disk/by-uuid/25f84e22-f38f-4f7a-8251-61e1299482ff -p /mnt/red_portable-storage-a01

if $(/etc/zsh/is-drive-pluged-in.sh 2a8ecca3-59b2-4ca0-ac37-c9f6b463e507 > /dev/null); then
	/etc/zsh/mount-drive.sh -esd /dev/disk/by-uuid/2a8ecca3-59b2-4ca0-ac37-c9f6b463e507 -p /mnt/green_hot-storage-a01
fi

if $(/etc/zsh/is-drive-pluged-in.sh 215a9e0d-82bb-45c1-bbf6-e8af0fe7b754 > /dev/null); then
	/etc/zsh/mount-drive.sh -esd /dev/disk/by-uuid/215a9e0d-82bb-45c1-bbf6-e8af0fe7b754 -p /mnt/green_hot-storage-a02
fi

if $(/etc/zsh/is-drive-pluged-in.sh 66a3881d-2b51-45ed-8658-bc0748a6128e > /dev/null); then
	/etc/zsh/mount-drive.sh -esd /dev/disk/by-uuid/66a3881d-2b51-45ed-8658-bc0748a6128e -d /dev/disk/by-uuid/a3516148-900a-4d57-9a22-daa16c5f46c1 -p /mnt/red_cold-storage-a01
fi

#/etc/zsh/close-key.sh 0
