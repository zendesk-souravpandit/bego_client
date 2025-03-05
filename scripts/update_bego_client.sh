#!/bin/bash

# Define source and destination paths
SOURCE="./application/bego/build/web"
DESTINATION="./../business_ocean/public"

# Check if source directory exists
if [ ! -d "$SOURCE" ]; then
  echo "Error: Source directory $SOURCE does not exist."
  exit 1
fi

# Create destination directory if it does not exist
if [ ! -d "$DESTINATION" ]; then
  echo "Destination directory $DESTINATION does not exist. Creating it..."
  mkdir -p "$DESTINATION"
fi

# Copy the source directory and its contents to the destination
echo "Copying contents from $SOURCE to $DESTINATION..."
cp -R "$SOURCE"/* "$DESTINATION"

# Verify if the copy was successful
if [ $? -eq 0 ]; then
  echo "Copy operation completed successfully."
else
  echo "Error: Copy operation failed."
  exit 1
fi
