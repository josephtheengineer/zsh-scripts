function main {
	source /etc/zsh/use-key.sh
	/etc/zsh/close-key.sh 5 &
	ssh -tt ssh.theengineer.life
}

main "$@"
