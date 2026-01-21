#!/bin/bash
# Claude TaskMaster Init - Installer for Linux/macOS/WSL

set -e

REPO="mister-X-is-your-father/claude-taskmaster-init"
BRANCH="master"
INSTALL_DIR="$HOME/bin"

echo "==================================="
echo " Claude TaskMaster Init Installer"
echo "==================================="
echo ""

# Create bin directory
mkdir -p "$INSTALL_DIR"

# Download script
echo "Downloading new-project..."
curl -fsSL "https://raw.githubusercontent.com/$REPO/$BRANCH/new-project" -o "$INSTALL_DIR/new-project"
chmod +x "$INSTALL_DIR/new-project"

# Add to PATH if not already
if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
    SHELL_RC=""
    if [ -f "$HOME/.zshrc" ]; then
        SHELL_RC="$HOME/.zshrc"
    elif [ -f "$HOME/.bashrc" ]; then
        SHELL_RC="$HOME/.bashrc"
    elif [ -f "$HOME/.bash_profile" ]; then
        SHELL_RC="$HOME/.bash_profile"
    fi

    if [ -n "$SHELL_RC" ]; then
        echo "" >> "$SHELL_RC"
        echo "# Claude TaskMaster Init" >> "$SHELL_RC"
        echo 'export PATH="$HOME/bin:$PATH"' >> "$SHELL_RC"
        echo "Added ~/bin to PATH in $SHELL_RC"
    fi
fi

echo ""
echo "Installation complete!"
echo ""
echo "Usage:"
echo "  new-project <project-name>"
echo ""
echo "Run 'source ~/.bashrc' or open a new terminal to use."
