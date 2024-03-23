#!/bin/bash

wall_dir="${HOME}/Imagens/wallpapers"
cache_dir="${HOME}/.cache/mywallpaper"

# Convert images in directory and save to cache dir
for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp}; do
	if [ -f "$img" ]; then
		nombre_archivo=$(basename "$img")
			if [ ! -f "${cache_dir}/${name_file}" ] ; then
				convert -strip "$img" -thumbnail 500x500^ -gravity center -extent 500x500 "${cache_dir}/${name_file}"
			fi
    fi
done


wall_select=$(find "${wall_dir}"  -maxdepth 1  -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A ; do  echo -en "$A\x00icon\x1f""${cache_dir}"/"$A\n" ; done | rofi -dmenu)

# Set the wallpaper
[[ -n "$wall_select" ]] || exit 1

monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`

hyprctl hyprpaper unload all
hyprctl hyprpaper preload ${wall_dir}/${wall_select}
hyprctl hyprpaper wallpaper "$monitor, $wall_dir/$wall_select"

exit 0

