for fd in ./*; do
	if [[ -d "$fd" ]]; then
		cd "$fd"; ls ; cd ../;
	else echo $fd
	fi;
done
