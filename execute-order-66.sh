#!/usr/bin/env bash

###############################################################################
# UTILS: Check for required functions file
###############################################################################

if [ -e utils.sh ]; then
	cd "$(dirname "${BASH_SOURCE[0]}")" \
		&& . "utils.sh"
else
	printf "\n ⚠️  ./utils.sh not found  💃🏾 First, you need to make utils function available \n"
	exit 1
fi

###############################################################################
# CHECK: Bash version
###############################################################################

check_bash_version

###############################################################################
# CHECK: Internet
###############################################################################

chapter "Checking internet connection…"
check_internet_connection

###############################################################################
# PROMPT: SSH Key
###############################################################################

chapter 'Checking for SSH key…'
ssh_key_setup

###############################################################################
# INSTALL: Dependencies
###############################################################################

chapter "Installing Dependencies…"

# -----------------------------------------------------------------------------
# XCode
# -----------------------------------------------------------------------------
if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
	test -d "${xpath}" && test -x "${xpath}" ; then
	print_success_muted "Xcode already installed. Skipping."
else
	step "Installing Xcode…"
	xcode-select --install
	print_success "Xcode installed!"
fi

if [ ! -d "$HOME/.bin/" ]; then
	mkdir "$HOME/.bin"
fi

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
# INSTALL: Apps and binaries && npm globals
###############################################################################

if [ -e brew.sh ]; then
	cd "$(dirname "${BASH_SOURCE[0]}")" \
		&& . "brew.sh"
else
	printf "\n ⚠️  ./brew.sh not found  💃🏾 I cannot install apps and binaries bro! \n"
	exit 1
fi

if [ -e npm.sh ]; then
	cd "$(dirname "${BASH_SOURCE[0]}")" \
		&& . "npm.sh"
else
	printf "\n ⚠️  ./npm.sh not found  💃🏾  How can I install global npm packages when there is no npm.sh ? \n"
	exit 1
fi


###############################################################################
# SETUP: Directories
###############################################################################

DIRECTORIES=(
    $HOME/Projects/devel
    $HOME/Projects/work
    $HOME/Desktop/GIFs
)

step "Making directories…"
for dir in ${DIRECTORIES[@]}; do
    mkd $dir
done

###############################################################################
# SETUP: MacOs defaults
###############################################################################

if [ -e .macos ]; then
	cd "$(dirname "${BASH_SOURCE[0]}")" \
		&& . ".macos"
else
	printf "\n ⚠️  ./.macos not found  💃🏾  How can I setup your new Mac when ther is no /.macos ha? \n"
	exit 1
fi

###############################################################################
# ⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️ 👀🔥
###############################################################################

e-order-66-done
