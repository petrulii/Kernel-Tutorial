#!/bin/bash

# Function to check if a Python package is installed
package_exists() {
    python3 -c "import $1" &> /dev/null
}

# List of required Python packages
required_packages=("numpy" "matplotlib" "graphkit-learn" "networkx" "scikit-learn")

# Install or update required packages
for package in "${required_packages[@]}"; do
    if package_exists "$package"; then
        echo "$package is already installed. Updating..."
        pip install --upgrade "$package"
    else
        echo "Installing $package..."
        pip install "$package"
    fi
done
