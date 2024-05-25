#!/bin/sh

: '
TLDR: This script will only run once on initial project creation, then will not run again.
      The alternative was documenting the steps in a README file,
      but I thought that might distract the readers from the main goal of the project.

---

This script is used to set up a new .NET project in a specified directory. 

It defines a function, check_and_create, which takes three arguments:
- dir: The directory where the project should be created.
- template: The .NET template to use for the new project.
- proj_name: The name of the project.

The function checks if the directory exists and is not empty. If the directory does not exist or is empty, 
it creates a new project in the directory using the specified .NET template. If the directory already exists 
and is not empty, it prints a message saying that the project already exists.

Usage:
./setup.sh [directory] [template] [project_name]
'

# If a specified directory doesn't exist or is empty, create a new project in that directory.
check_and_create() {
  local dir=$1
  local template=$2
  local proj_name=$3

  if [ ! -d $dir ] || [ -z "$(ls -A $dir)" ]; then
    echo "Creating $proj_name project in $dir..."
    dotnet new $template -o $dir
    echo "$proj_name project created."
  else
    echo "$proj_name project already exists in $dir."
  fi
}

# Check and create Client project
check_and_create "src/Client" "blazorwasm" "Blazor WebAssembly"

# Check and create Server project
check_and_create "src/Server" "webapi" "ASP.NET Core Web API"

# Add necessary packages to Server project
if [ -d "src/Server" ] && [ -n "$(ls -A src/Server)" ]; then
  echo "Adding packages to Server project..."
  dotnet add src/Server package Dapr.Client
  dotnet add src/Server package Dapr.AspNetCore
fi

# Check and create Shared project
check_and_create "src/Shared" "classlib" "Shared"

# Add references to Shared project
if [ -d "src/Client" ] && [ -n "$(ls -A src/Client)" ]; then
  dotnet add src/Client reference src/Shared
fi

if [ -d "src/Server" ] && [ -n "$(ls -A src/Server)" ]; then
  dotnet add src/Server reference src/Shared
fi
