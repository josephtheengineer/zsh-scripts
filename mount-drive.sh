init="	source ~/etc/zsh/.zshrc;
	/etc/zsh/fix-gpg.sh > /dev/null;
	export GPG_TTY=\$(tty);
	export SSH_AUTH_SOCK=\$(gpgconf --list-dirs agent-ssh-socket);
	gpg-connect-agent updatestartuptty /bye > /dev/null"

function main {
	encrypted=false
	store=false
	drive=()
	path=""

	check "$@"

	mount "$drive" "$path" "$encrypted" "$store"

	exit 1
}

function check {
	local OPTIND opt
	while getopts ":esd:p:" opt; do
		case $opt in
			e) encrypted=true;;
			s) store=true;;
			d) drive+=("$OPTARG");;
			p) path="$OPTARG";;
			\?h) help;exit 1;;
		esac
	done
	shift $((OPTIND -1))
}

function mount {
	echo "Mounting $(basename $2)..."
	drive=""
	if [ -z "$1" ]; then

		mountable=$(lsblk -lp | grep "part  $" | awk '{print $1, "(" $4 ")"}')

		[[ "$mountable" = "" ]] && exit 1

		echo "$mountable"
		echo "Mount drive:"

		read drive
	else
		drive=$1
	fi

	[[ "$drive" = "" ]] && exit 1
	#sudo mount "$drive" && exit 0

	mountpoint=""
	if [ -z "$2" ]; then
		dirs=$(find /mnt /home -type d -maxdepth 2 2>/dev/null)
		echo "$dirs"

		echo "Mount point:"
		read mountpoint
	else
		mountpoint=$2
	fi

	[[ "$mountpoint" = "" ]] && exit 1

	if [[ ! -d "$mountpoint" ]]; then
		echo "$mountpoint does not exist. Create it?"
		echo -e "n\ny"
		read mkdiryn
		[[ "$mkdiryn" = y ]] && sudo mkdir -p "$mountpoint"
	fi
	if [[ $3 = true ]]; then
		counter=0
		drive_name=""
		for single_drive in "${drive[@]}"; do
			counter=$((counter + 1))
			if [ ${#drive[@]} -eq 1 ]; then
				drive_name=$(basename $mountpoint)
			else
				drive_name="$(basename $mountpoint)-$counter"
			fi

			if [[ $4 = true ]]; then
				echo "Fetching password for $drive_name..."
				pass="$(ssh -tq ssh.theengineer.life "eval $init; pass drive/$drive_name" | tee /dev/tty | tail -n1)"
				pass="${pass: -26}"
				pass="${pass%?}"
				echo "$pass" | sudo cryptsetup open --type luks $single_drive $drive_name #${single_drive#"/dev/"}
			else
				sudo cryptsetup open --type luks $single_drive $drive_name #${single_drive#"/dev/"}
			fi
		done
		sudo mount /dev/mapper/$drive_name $mountpoint && echo "${drive[@]} mounted to $mountpoint."
	else
		sudo mount $drive $mountpoint && echo "$drive mounted to $mountpoint."
	fi
}

main "$@"
