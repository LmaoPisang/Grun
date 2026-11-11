#!/usr/bin/env bash

# Create local bin if it doesn't exist
mkdir -p ~/.local/bin

# Move the script and make it executable
cp grun ~/.local/bin/grun
chmod +x ~/.local/bin/grun

echo "✅ 'grun' installed to ~/.local/bin"
echo "💡 Make sure ~/.local/bin is in your PATH!"
