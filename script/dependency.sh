

EXIT_CODE_DISTRO=21

detect_distro(){
	

	local distro_id
	if [  -f /etc/os-release ] ; then
		
		source /etc/os-release
		distro_id=$ID
		
	else
		echo "Can't establish the distro, install the dependency manually." >&2
		exit EXIT_CODE_DISTRO
	fi
	echo "$distro_id"	
}


install_dependency(){
	local distro=$1

	case "$distro" in
		arch)
			sudo pacman -Ss gcc make linux-headers
			;;
		guix)  
			guix install  gcc make linux-libre-headers
			;;
		*)
			echo "Set your own distro package manager"
			;;
	esac

}

DISTRO_NAME=$(detect_distro)

echo "Find distro $DISTRO_NAME"

install_dependency $DISTRO_NAME

echo "Done"




