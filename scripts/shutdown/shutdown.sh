#!/usr/bin/bash

working_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
images_path="${working_dir}"

## Save the files in the array $files
files=("$images_path"/*.jpg)
# Get a random file from path
rand_file="${files[RANDOM % ${#files[@]}]}"

conf_path="${images_path}/shutdownImage.conf"

# create a hyprlock conf file for displaying wallpaper 
# and echo the config in to file
echo "background {
    monitor =
    path = ${rand_file}
    blur_passes = 0
}" > $conf_path 

# run the hyprlock and then shutdown the computer
hyprlock -c "${conf_path}" &

# sleep for n secons
sleep 5

# shutdown
shutdown -h now 



