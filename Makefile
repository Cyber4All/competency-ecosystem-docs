all: usage

usage:
	@echo "Usage: make [install-ruby | install-jekyll | serve]"

install-ruby:
	@echo "[-] Installing chruby and ruby-install..."
	HOMEBREW_NO_AUTO_UPDATE=1 brew install chruby ruby-install xz
	
	@echo "[\] Installing ruby-3.1.3..."
	ruby-install ruby-3.1.3

	@echo "[|] Setting up bash_profile..."
	grep -qxF "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" ~/.bash_profile || echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.bash_profile
	grep -qxF "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.bash_profile || echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.bash_profile
	grep -qxF "chruby ruby-3.1.3" >> ~/.bash_profile || echo "chruby ruby-3.1.3" >> ~/.bash_profile

	@echo "[/] Setting up zsh profile..."
	grep -qxF "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" ~/.zshrc || echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
	grep -qxF "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc || echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
	grep -qxF "chruby ruby-3.1.3" >> ~/.zshrc || echo "chruby ruby-3.1.3" >> ~/.zshrc

install-jekyll:
	@echo "[-] Installing Jekyll..."
	gem install jekyll bundler

	@ echo "[\] Installing ffi dependency..."
	gem install ffi

	@echo "[|] Initializing Gem file..."
	bundle init || true

serve:
	@echo "[-] Installing Gem dependencies..."
	bundle

	@echo "[\] Installing jekyll bundler..."
	gem install jekyll bundler

	@echo "[|] Building jekyll..."
	bundle exec jekyll build

	@echo "[/] Serving project..."
	bundle exec jekyll serve