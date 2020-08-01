function main {
	/etc/zsh/mount-keys.sh
	eval $(ssh-agent)
	ssh-add /mnt/keys/private-keys/key1
	sudo umount /mnt/keys
}

main "$@"
