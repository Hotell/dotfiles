#!/usr/bin/env bash

###############################################################################
# INSTALL: Dependencies
###############################################################################

# -----------------------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------------------
if ! [ -x "$(command -v brew)" ]; then
	step "Installing Homebrew…"
	curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
	export PATH="/usr/local/bin:$PATH"
	print_success "Homebrew installed!"
else
	print_success_muted "Homebrew already installed. Skipping."
fi

if brew list | grep -Fq brew-cask; then
	step "Uninstalling old Homebrew-Cask…"
	brew uninstall --force brew-cask
	print_success "Homebrew-Cask uninstalled!"
fi

###############################################################################
# UPDATE: Homebrew
###############################################################################
chapter "Updating Homebrew formulae…"
brew update
# Upgrade any already-installed formulae.
brew upgrade

###############################################################################
# INSTALL: brews
###############################################################################

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
# brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
# brew install xz

# Install other useful binaries.
brew install ack
# brew install exiv2
brew install git
# Git extension for versioning large files
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
# p7zip is a port of 7za.exe for POSIX systems like Unix (Linux, Solaris, OpenBSD, FreeBSD, Cygwin, AIX, ...), MacOS X and also for BeOS and Amiga.
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# tool for installing AppStore apps via homebrew
brew install mas

# managing Dock
brew install dockutil

# javascript !
brew install node@8
brew install yarn

# z hopping around folders
brew install z


###############################################################################
# INSTALL: casks
###############################################################################

# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`

# Install native apps

# daily
brew cask install spectacle
brew cask install rescuetime
brew cask install google-drive-file-stream
brew cask install flux
brew cask install turbo-boost-switcher
brew cask install smcfancontrol
# brew cask install gyazo
# brew cask install 1password

# dev
brew cask install iterm2
brew cask install hyper
brew cask install visual-studio-code
brew cask install imagealpha
brew cask install imageoptim
brew cask install virtualbox
brew cask install vagrant
brew cask install docker
brew cask install postman

# browsers
brew cask install google-chrome
brew cask install firefox
brew cask install brave
brew cask install torbrowser
# brew cask install google-chrome-canary
# brew cask install firefoxdeveloperedition
# brew cask install webkit-nightly
# brew cask install chromium
# brew cask install torbrowser

# misc
brew cask install appcleaner
brew cask install vlc
brew cask install licecap
brew cask install spotify
brew cask install skype
# brew cask install gpgtools
# brew cask install screenflow
# brew cask install disk-inventory-x
# brew cask install utorrent


# fonts
brew tap caskroom/fonts
brew cask install font-fira-code


###############################################################################
# INSTALL: Mac App Store Apps
###############################################################################

chapter "Installing apps from App Store…"
if [ -x mas ]; then

	print_warning "Please install mas-cli first: brew mas. Skipping."

	else

	if [ -e $cwd/swag/apps ]; then
		if mas_setup; then
			# Workaround for associative array in Bash 3
			# https://stackoverflow.com/questions/6047648/bash-4-associative-arrays-error-declare-a-invalid-option
			for app in $(<$cwd/swag/apps); do
				KEY="${app%%::*}"
				VALUE="${app##*::}"
				install_application_via_app_store $KEY $VALUE
			done
		else
			print_warning "Please signin to App Store first. Skipping."
		fi
	fi

fi


###############################################################################
# CLEAN: Homebrew files
###############################################################################
chapter "Cleaning up Homebrew files…"
brew cleanup 2> /dev/null
brew cask cleanup 2> /dev/null
