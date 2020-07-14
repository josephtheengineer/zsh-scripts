FOO=`ls`
WORDTOREMOVE="Desktop"

printf '%s\n' "${FOO//$WORDTOREMOVE/}"

#ls -I {Desktop,workspace}
