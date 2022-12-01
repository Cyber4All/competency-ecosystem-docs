# Setup ruby on mac OS and serve this site locally with jekyll

## Step 1: Install and use the correct version of ruby

#### Install dependancies

```bash
brew install chruby ruby-install xz
```

#### Install latest stable version of ruby
```bash
ruby-install ruby-3.1.3
```

This will take a few minutes but afterwards you should configure zsh to use this version instead of the default

#### Configure your teminal to use the correct version by default

```bash
echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo "chruby ruby-3.1.3" >> ~/.zshrc
```
after this you can exit out and open a new terminal or type:
```bash 
source .zshrc
```
then
```bash
ruby -v
```
should show:
```bash
ruby 3.1.3p185 (2022-11-24 revision 1a6b16756e) [arm64-darwin22]
```
or something similar.

### Step 2: installing jekyll and bundler

Easy peasy, just type 
```bash
gem install jekyll bundler
```

Gem is ruby's package manager, like Pip is to Python, or npm is to Node.

#### Step 3: Run it

First, go to the _config.yml and uncomment `theme: just-the-docs` or you won't have a theme in the local server.

##### NOTE: comment it out before you push to releases or the github action will fail

```bash
cd /path/to/competency-ecosystem-docs
bundle exec jekyll build
```

this shouldn't take long just wait for it to finish then you can run

```bash
bundle exec jekyll serve
```

and you should see 

```bash
Configuration file: /path/to/competency-ecosystem-docs/_config.yml
            Source: /path/to/competency-ecosystem-docs
       Destination: /path/to/competency-ecosystem-docs/_site
 Incremental build: disabled. Enable with --incremental
      Generating... 
                    done in 1.06 seconds.
 Auto-regeneration: enabled for '/path/to/competency-ecosystem-docs'
    Server address: http://127.0.0.1:4000
  Server running... press ctrl-c to stop.
```

*Congratulations!!!*, you may now write documentation.

