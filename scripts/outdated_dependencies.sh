#!/bin/bash

# Function to find and update all pubspec.yaml files
update_dependencies() {
  local dir=$1

  if [ -f "$dir/pubspec.yaml" ]; then
    echo "Updating dependencies in $dir"
    (cd "$dir" && flutter pub outdated)
  fi

  for subdir in "$dir"/*/; do
    if [ -d "$subdir" ]; then
      update_dependencies "$subdir"
    fi
  done
}

# Start from the current directory
update_dependencies "."
