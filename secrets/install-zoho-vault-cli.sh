#!/bin/bash

# This script downloads and installs the Zoho Vault CLI for macOS.

# URL for the Zoho Vault CLI for macOS
ZV_CLI_URL="https://downloads.zohocdn.com/vault-cli-desktop/macos/zv_cli.zip"

# Directory to install the CLI to
INSTALL_DIR="/usr/local/bin"

# Name of the CLI executable
CLI_NAME="zv"

# Temporary directory for extraction
TEMP_DIR=$(mktemp -d)

# Download the CLI
echo "Downloading Zoho Vault CLI..."
curl -L -o "$TEMP_DIR/zv_cli.zip" "$ZV_CLI_URL"

# Unzip the CLI
echo "Unzipping the CLI..."
unzip "$TEMP_DIR/zv_cli.zip" -d "$TEMP_DIR"

# Make the CLI executable
chmod +x "$TEMP_DIR/$CLI_NAME"

# Move the CLI to the installation directory
echo "Installing Zoho Vault CLI to $INSTALL_DIR..."
sudo mv "$TEMP_DIR/$CLI_NAME" "$INSTALL_DIR"

# Clean up the temporary directory
rm -rf "$TEMP_DIR"

# Verify the installation
if [ -x "$INSTALL_DIR/$CLI_NAME" ]; then
    echo "Zoho Vault CLI installed successfully."
    echo "You can now use the 'zv' command."
else
    echo "Error: Zoho Vault CLI installation failed."
fi
