function main {
	source /etc/zsh/use-key.sh

	ssh -t ssh.theengineer.life "
	source ~/etc/zsh/.zshrc
	/etc/zsh/fix-gpg.sh > /dev/null;
	export GPG_TTY=\$(tty);
	export SSH_AUTH_SOCK=\$(gpgconf --list-dirs agent-ssh-socket);
	gpg-connect-agent updatestartuptty /bye > /dev/null;
	echo '------------------------------------';
	pass $@;
	echo '------------------------------------'"

	/etc/zsh/close-key.sh 0
}


main "$@"
