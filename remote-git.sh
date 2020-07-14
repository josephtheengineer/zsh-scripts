function main {
	/etc/zsh/rsshfs/rsshfs.sh $PWD ssh.theengineer.life:/home/josephtheengineer/var/cache/remote-git &

	ssh -t ssh.theengineer.life "
	source ~/etc/zsh/.zshrc
	/etc/zsh/fix-gpg.sh > /dev/null;
	export GPG_TTY=\$(tty);
	export SSH_AUTH_SOCK=\$(gpgconf --list-dirs agent-ssh-socket);
	gpg-connect-agent updatestartuptty /bye > /dev/null;
	cd ~/var/cache/remote-git;
	echo '------------------------------------';
	git $@;
	echo '------------------------------------'"

	/etc/zsh/rsshfs/rsshfs.sh -u ssh.theengineer.life:/home/josephtheengineer/var/cache/remote-git
}

main "$@"
