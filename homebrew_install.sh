#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."
brew upgrade

formulas=(
    cask
    colordiff
    coreutils
    curl
    emacs
    gcc
    git
    nkf
    opam
    pyenv
    pyenv-virtualenv
    ruby
    tig
    tree
    wget
    "--without-etcdir zsh"
)

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install ${formula} || brew upgrade ${formula}
done

casks=(
    dropbox
    shiftit
    iterm2
    slack
    google-chrome
    google-japanese-ime
    # mactex
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install ${cask}
done

# brew cleanup
# brew cask cleanup
