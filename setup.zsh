#!/bin/zsh
brew install chruby ruby-install xz
xcode-select --install
ruby-install ruby-3.1.3
echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo "chruby ruby-3.1.3" >> ~/.zshrc
source ~/.zshrc
gem install jekyll bundler
bundle install

