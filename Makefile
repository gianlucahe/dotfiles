# Makefile for dotfiles setup
# Supports macOS with Homebrew

.PHONY: install brew tools dev-tools apps fonts

# Install everything
install: brew tools dev-tools apps fonts
	@echo "✅ All installations complete!"

# Install Homebrew
brew:
	@if ! command -v brew &> /dev/null; then \
		echo "📦 Installing Homebrew..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "✅ Homebrew already installed"; \
	fi
	@brew update && brew upgrade

# Essential command-line tools
tools:
	@echo "🔧 Installing essential tools..."
	brew install starship
	brew install tmux
	brew install neovim
	brew install git
	brew install curl
	brew install wget
	brew install ripgrep
	brew install fzf
	brew install zoxide
	brew install eza
	brew install bat
	brew install fd
	brew install rsync

# Development tools
dev-tools:
	@echo "💻 Installing development tools..."
	brew install node
	brew install python3
	brew install go
	brew install rust
	brew install bun

# GUI applications
apps:
	@echo "🖥️ Installing GUI applications..."
	brew install --cask ghostty
	brew install --cask helium-browser
	brew install --cask discord
	brew install --cask slack
	brew install --cask notion

# Useful fonts for development
fonts:
	@echo "🔤 Installing fonts..."
	brew install --cask font-jetbrains-mono-nerd-font
	brew install --cask font-fira-code-nerd-font
	brew install --cask font-source-code-pro

