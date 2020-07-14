function main {
	output=$(ssh -t ssh.theengineer.life "$@")

	if [ -n "$output" ]; then
		echo "$output"
	else
		echo "error: remote output was null"
		exit 1
	fi
}

main "$@"
