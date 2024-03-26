#!/bin/bash

wall_dir="${HOME}/Imagens/wallpapers"
cache_dir="${HOME}/.cache/mywallpaper"

# Convert images in directory and save to cache dir
for img in "$wall_dir"/*.{jpg,jpeg,png,webp}; do
	if [ -f "$img" ]; then
		name_file=$(basename "$img")
			if [ ! -f "${cache_dir}/${name_file}" ] ; then
				convert -strip "$img" -thumbnail 500x500^ -gravity center -extent 500x500 "${cache_dir}/${name_file}"
			fi
    fi
done


wall_select=$(find "${wall_dir}"  -maxdepth 1  -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A ; do  echo -en "$A\x00icon\x1f""${cache_dir}"/"$A\n" ; done | rofi -dmenu)

# Set the wallpaper
[[ -n "$wall_select" ]] || exit 1

hyprctl hyprpaper unload all
hyprctl hyprpaper preload ${wall_dir}/${wall_select}

for monitor_id in $(hyprctl monitors | grep 'Monitor' | awk '{ print $2 }'); do
  hyprctl hyprpaper wallpaper "$monitor_id, $wall_dir/$wall_select"
done

exit 0

