for file in *
do
	new_name=$(echo "$file" | cut -d '(' -f 1)
	new_name+=$(echo "$file" | cut -d ')' -f 2 | tr '\n' '' )
	mv "$file" "$new_name"
done
