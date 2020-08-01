function main {
	sleep $1
	sudo pkill ssh-agent
}

main "$@"
