function main {
	if [[ $(lsblk -o uuid) == *"$1"* ]]; then
		echo "Drive is pluged in!"
		exit 0
	else
		echo "Drive is not pluged in"
		exit 1
	fi
}

main "$@"
