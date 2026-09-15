#!/bin/sh
#
#  Build SwagOS ISO - generates Swag_OS.iso using Void image building tools:
#  https://github.com/void-linux/void-mklive
#
#
#    DONE:
#
#    - Check PWD and download/update void-mklive tools
#    - CLI menu
#
#
#    TODO:
#
#    - Helper functions (menus, multi select, fzf...)
#    - 
#
#

fingerprint() {
	printf
}

check_pwd() {
	EXPECTED_DIR="SwagOS-Image-Builder"
	CURRENT_DIR=$(pwd | awk -F '/' '{print $NF}')

	if [ "$CURRENT_DIR" != "$EXPECTED_DIR" ]; then
		echo "This script should only be executed in its directory"
		exit 1
	fi

	PROFILE_DIR="$PWD/profiles"
}

check_dep() {
	command -v git >/dev/null 2>&1 || {
		echo "Error: git is not installed" >&2
		exit 1
	}

	if [ -d void-mklive ]; then
		cd void-mklive
		git pull
		cd ..
	else
		echo "void-mklive not detected"
		echo "downloading from github"
		git clone https://github.com/void-linux/void-mklive
	fi

	echo "void-mklive ready to use"
}

build_iso() {
	clear
	for dir in "$PROFILE_DIR"/*; do
		n=1
		[ -d "$dir" ] || continue
		name=$(basename "$dir")
		MENU_ITEMS="$n - $name"
		let "n+=1"
	done
	echo "\n$MENU_ITEMS\n"
}

new_profile() {
	echo "owaoeza"
}

edit_profile() {
	echo "owaoeza"
}

delete_profile() {
	echo "owaoeza"
}

main() {
	clear
	echo "\n\
	1 - Build ISO from profile \n\
	2 - Generate new profile \n\
	3 - Edit profile\n\
	4 - Delete profile\n\
	\n\
	q - Quit\n"
	while true; do
		read -p "Select action: " ans
		case $ans in
			1 ) build_iso;;
			2 ) new_profile;;
			3 ) edit_profile;;
			4 ) delete_profile;;
			q ) exit ;;
			* ) echo "Please answer by a number or q to quit"
		esac
	done
}

check_pwd
check_dep
main
