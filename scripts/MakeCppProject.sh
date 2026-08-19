#!/usr/bin/bash
###################################
#### Create CPP project script ####
###################################

#### Colors ####
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Reset

set -e 

## Install dev tools if needed
read -p "Do you want ot install devlopment tools (gcc, cmake)? [y/N]: " install_tools
if [[ "$install_tools" =~ ^[Yy]$ ]]; then
  echo -e "${GREEN}Installing development tools...${NC}"
  sudo pacman -Sy --needed gcc cmake || { echo -e "${RED}Failed to install tools"; exit 1; }
fi

echo "Enter the project name: "
read project_name

# Create a directory for the project
if [ ! -d "./$project_name" ]; then
  echo "Creating project directory: $project_name"
  mkdir "$project_name" || { echo -e "${RED}Failed to create project directory"; exit 1; }
fi 

# Create sub directorys 
cd "$project_name" || { echo -e "${RED}Failed to navigate to project directory"; exit 1; }
mkdir -p src build release || { echo -e "${RED}Failed to navigate to project directory"; exit 1; }

# Create main.cpp with default template  
cat <<EOL >./src/main.cpp
#include <iostream>

int main() {
  std::cout << "Hello, $project_name!!!" << std::endl;
  return 0; 
}
EOL

# Create CMakeList.txt
cat <<EOL > CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project($project_name)

# Set C++ Standard and Flags
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "\${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")

# Set Srouce Dir
set(source_dir "\${CMAKE_CURRENT_SOURCE_DIR}/src") 

# Add Source Files
file(GLOB source_files "\${source_dir}/*.cpp")

# Add Executable
add_executable($project_name \${source_files})
EOL

# Create build.sh script
cat <<EOL > compile.sh
#!/bin/bash
set -e # Exit on error

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Reset

cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -S . -B build

# build the project
cmake --build build

# check if th ebuild was successful
if [ $? -eq 0 ]; then
  echo -e "${GREEN}Build successful!"
  mv build/$project_name release/ || { echo "Failed to move executable"; exit 1; }

  echo -e "Running the program...${NC}"
  echo " "
  ./release/$project_name || { echo "Failed to execute program"; exit 1; }
else
  echo -e "${RED}Build failed.${NC}"
  exit 1
fi
EOL

chmod +x compile.sh

# Final Message
echo -e "${GREEN}Project $project_name setup has completed!${NC}"
echo "To build the project, run ./compile.sh in the project directory."















