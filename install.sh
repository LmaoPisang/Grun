#!/usr/bin/env bash

# Variables
REPO_RAW_URL="https://raw.githubusercontent.com/YOUR_USERNAME/grun/main/grun"
BIN_DIR="$HOME/.local/bin"

echo "🚀 Starting grun installation..."

# 1. Create the directory if it doesn't exist
mkdir -p "$BIN_DIR"

# 2. Download the grun script
if curl -sSL "$REPO_RAW_URL" -o "$BIN_DIR/grun"; then
    chmod +x "$BIN_DIR/grun"
    echo "✅ 'grun' has been placed in $BIN_DIR"
else
    echo "❌ Error: Could not download 'grun'. Check your internet or URL."
    exit 1
fi

# 3. Check if BIN_DIR is in the PATH
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo "----------------------------------------------------------"
    echo "⚠️  WARNING: $BIN_DIR is not in your PATH."
    
    # Detect shell to give the right command
    case "$SHELL" in
        */zsh)
            echo "👉 Add this to your ~/.zshrc:"
            echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
            ;;
        */fish)
            echo "👉 Run this in your terminal:"
            echo "   fish_add_path ~/.local/bin"
            ;;
        *)
            echo "👉 Add this to your ~/.bashrc:"
            echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
            ;;
    esac
    echo "----------------------------------------------------------"
else
    echo "🎉 Installation successful! Try running 'grun yourfile.cpp'"
fi
