#!/usr/bin/bash
#####################################
#### Symlink dotfiles to .config ####
#####################################

set -e

skip_directorys=" scripts home "

working_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# exit the program if we are not running the script at the script file location
if [[ $PWD != $working_dir ]]; then
  echo "Exited Program. Run the script file at location at ${working_dir}"
  return
fi

#### symlink directorys to .config ####
symlink_dirs(){
  ## check if we want to symlink dotfiles
  read -p "Do you want to symlink config directorys? [Y/n]: " install_tools
  if [[ "$install_tools" =~ ^[Nn]$ ]]; then
    exit 0;
  fi

  for dir_path in */; do 
    dir_name=${dir_path%/}
    
    # check the dir name and if its in the skip declareation we skip it as we are going to do something else with it
    if [[ " $skip_directorys " =~ " $dir_name " ]]; then
      # do nothing as it is only files 
      continue
    fi 

    source_path="${working_dir}/${dir_name}"

    #echo "Processing: $dir_name"
    target_path="$HOME/.config/${dir_name}"

    # create symlinks from this directory to .config
    if [ -L "$target_path" ]; then
      echo "$target_path is already a symlink directory. Overriding the symlink file"
      ln -sfn "$source_path" "$target_path"

    # if there is an old file, ask if we want to backup it
    elif [[ -d "$target_path" ]]; then
      echo "$target_path is a REAL directory."

      read -p "Do you want to backup the old directorys? [y/N]: " backup_dir
      if [[ "$backup_dir" =~ ^[Yy]$ ]]; then
        echo "${target_path} has been renamed to ${target_path}.bak"
        mv "$target_path" "${target_path}.bak"
      else
        rm -rf "$target_path"
      fi

      ln -s "$source_path" "$target_path"

    else
      echo "Creating a symlink target from ${source_path} to ${target_path} "
      ln -s "$source_path" "$target_path"
    fi 

  done
}
symlink_dirs

#### symlink directorys to .config ####

#### symlink files from scripts ####
symlink_files(){
  read -p "Do you want to symlink config files? [Y/n]: " install_tools
  if [[ "$install_tools" =~ ^[Nn]$ ]]; then
    return
  fi

  working_path="${working_dir}/home"

  for source_path in ${working_path}/*; do
    file_name="${source_path##*/}"

    target_path="${HOME}/.${file_name}"
    mkdir -p "$(dirname "$target_path")"

    if [ -L "$target_path" ]; then
      echo "$target_path is already a symlink file. Overriding the symlink file"
      ln -sfn "$source_path" "$target_path"

    # if there is an old file, ask if we want to backup it
    elif [[ -f "$target_path" ]]; then
      echo "$target_path is a REAL file."

      read -p "Do you want to backup the old files? [y/N]: " backup_file
      if [[ "$backup_file" =~ ^[Yy]$ ]]; then
        echo "${target_path} has been renamed to ${target_path}.bak"
        mv "$target_path" "${target_path}.bak"
      else
        rm -rf "$target_path"
      fi

      ln -s "$source_path" "$target_path"

    else
      echo "Creating a symlink target from ${source_path} to ${target_path} "
      ln -s "$source_path" "$target_path"
    fi 

  done
}
symlink_files

#### symlink files from scripts ####

#### symlink script files ####
create_script_folder(){
  read -p "Do you want to symlink config script files? [Y/n]: " install_tools
  if [[ "$install_tools" =~ ^[Nn]$ ]]; then
    return
  fi

  working_path="${working_dir}/scripts"

  for source_path in ${working_path}/*; do
    file_name="${source_path##*/}"

    target_path="${HOME}/Scripts/${file_name}"
    mkdir -p "$(dirname "$target_path")"

    if [ -L "$target_path" ]; then
      echo "$target_path is already a symlink file. Overriding the symlink file"
      ln -sfn "$source_path" "$target_path"

    # if there is an old file, ask if we want to backup it
    elif [[ -f "$target_path" ]]; then
      echo "$target_path is a REAL file."

      read -p "Do you want to backup the old files? [y/N]: " backup_file
      if [[ "$backup_file" =~ ^[Yy]$ ]]; then
        echo "${target_path} has been renamed to ${target_path}.bak"
        mv "$target_path" "${target_path}.bak"
      else
        rm -rf "$target_path"
      fi

      ln -s "$source_path" "$target_path"

    else
      echo "Creating a symlink target from ${source_path} to ${target_path} "
      ln -s "$source_path" "$target_path"
    fi 

  done
}
create_script_folder

#### symlink script files ####





























