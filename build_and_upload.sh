#!/bin/bash

# Get the release version from the command line argument
release_version=$1

username=$ANACONDA_USERNAME
password=$ANACONDA_PASSWORD


echo $release_version

# Update the version in the setup.py file
sed -i "s/version=.*/version='$release_version',/" setup.py

# Build the package
conda build recipe -c defaults -c conda-forge

# Get the package file path
package_file_path=$(conda build recipe --output)

# Upload the package to Anaconda
anaconda login --username $username --password $password
anaconda upload -u $username --label main --private $package_file_path
anaconda logout

# Copy the package to the repository
cp $package_file_path .
