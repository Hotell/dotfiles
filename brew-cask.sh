#!/bin/bash

# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

brew install caskroom/cask/brew-cask
# brew tap caskroom/versions

# daily
brew cask install spectacle
# brew cask install gyazo
# brew cask install 1password
brew cask install rescuetime
brew cask install google-drive-file-stream
brew cask install flux
brew cask install turbo-boost-switcher
brew cask install smcfancontrol

# dev
brew cask install iterm2
brew cask install visual-studio-code
brew cask install imagealpha
brew cask install imageoptim
brew cask install virtualbox

# fun
# brew cask install limechat
# brew cask install miro-video-converter
# brew cask install horndis               # usb tethering

# browsers
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefox
brew cask install firefoxdeveloperedition
# brew cask install webkit-nightly
# brew cask install chromium
# brew cask install torbrowser

# less often
brew cask install appcleaner
brew cask install vlc
brew cask install licecap
brew cask install gpgtools
# brew cask install screenflow
# brew cask install disk-inventory-x
# brew cask install utorrent

brew cask install spotify

# fonts
brew tap caskroom/fonts
brew cask install font-fira-code


# Not on cask but I want regardless.

# File Multi Tool 5
# Phosphor
# Affinity Designer
# Lightshoot Screenshot
