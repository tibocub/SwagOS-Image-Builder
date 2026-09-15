#!/usr/bin/env bash

echo
echo ' ===== Profile reader ====='
echo

profile_dir=./profiles/Swag0S_x86-64_live
preset_list="${profile_dir}/presets"
pkgs_files=()
pkgs=()


declare -A seen=()
presets=()

while IFS= read -r file; do
	if [[ "$file" == \#* ]]; then
		continue
	fi

	while IFS= read -r line; do
		if [[ "$line" == \#* ]]; then
			continue
		fi

		if [[ ! ${seen[$line]+_} ]]; then
			seen[$line]=1
			pkgs+=("$line")
		fi
	done < "presets/$file/pkgs"
done < "$preset_list"


echo " - Total presets:"
printf '%s ' "${presets[@]}"
echo
	

echo " - Total packages:"
printf '%s ' "${pkgs[@]}"
echo


