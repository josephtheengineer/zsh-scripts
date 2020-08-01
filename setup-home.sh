echo "Setting up home dir..."

declare -i i=0
if [ ! -d ~/desktop ]; then
	echo "	Creating desktop folder..."
	mkdir ~/desktop
	i+=1
fi

if [ ! -d ~/downloads ]; then
	echo "	Creating downloads folder..."
	mkdir ~/downloads
	i+=1
fi


if [ ! -d ~/var/cache/trash ]; then
	echo "	Creating trash folder..."
	mkdir ~/var/cache/trash
	i+=1
fi

if [ -n "$(ls -d ~/.[!.]?* 2>/dev/null)" ]; then
	echo "	Removing hidden files..."
	mv ~/.* ~/var/cache/trash/ 2>/dev/null
	i+=1
fi

case "$i" in
0)
	echo "Finished! No operations completed."
	;;
*)
	echo "Finished! $i operations completed."
	;;
esac
