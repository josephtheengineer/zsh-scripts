function remove_temp {
	echo "-----------------------------------------------------"
	echo "${white}Removing temporary packages...${reset}"
	echo "${blue}	> nix-env -e '*'${reset}"
	#nix-env -e '*'

	echo "${blue}	> sudo nix-env -e '*'${reset}"
	#sudo nix-env -e '*'

	echo ""
	echo -n "Continue? [${white}Y${reset}/n]: "

	read response
	case "$response" in
		[nN][oO]|[nN])
			return 1
			;;
	esac
}

function upgrade_and_repair {
	echo "-----------------------------------------------------"
	echo "${white}Upgrading and reparing the system store...${reset}"
	echo "${blue}	> sudo nixos-rebuild switch --upgrade --repair
	--keep-going${reset}"
	#sudo nixos-rebuild switch --upgrade --repair --keep-going

	echo ""
	echo "-----------------------------------------------------"
	echo "${white}Removing old generations...${reset}"
	echo "${blue}	> nix-env --delete-generations old${reset}"
	nix-env --delete-generations old

	echo "${blue}	> sudo nix-env --delete-generations old${reset}"
	sudo nix-env --delete-generations old

	echo "${blue}  > sudo nixos-rebuild boot${reset}"
	sudo nixos-rebuild boot
}

function delete_unused {
	echo "-----------------------------------------------------"
	echo "${white}Deleting unused store paths...${reset}"
	echo "${blue}  > nix-collect-garbage${reset}"
	nix-collect-garbage

	echo "${blue}  > nix-collect-garbage -d${reset}"
	nix-collect-garbage -d

	echo "${blue}  > sudo nix-collect-garbage -d${reset}"
	sudo nix-collect-garbage -d
}

function optimise_store {
	echo "-----------------------------------------------------"
	echo "${white}Optimising store...${reset}"
	echo "${blue}	> nix-store --optimise${reset}"
	nix-store --optimise

	echo "${blue}	> sudo nix-store --optimise${reset}"
	sudo nix-store --optimise
}

function verify_dead {
	echo "-----------------------------------------------------"
	echo "${white}Verify dead paths${reset}"
	echo "${blue}	> nix-store --gc --print-dead${reset}"
	nix-store --gc --print-dead
}


function main {

	source /etc/zsh/terminal-colors.sh

	if ! remove_temp; then
		return 1
	fi
	upgrade_and_repair
	delete_unused
	optimise_store
	verify_dead
}

main "$@"
