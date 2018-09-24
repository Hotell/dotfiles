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
# INSTALL: Dependencies
###############################################################################

chapter "Installing Dependencies…"

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
# ⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️⚛️ 👀🔥
###############################################################################
e-order-66-done
