 #!/usr/bin/env bash

 ###############################################################################
# INSTALL: npm packages
###############################################################################

chapter "Installing npm packages…"

packages=(
  npm
  npx
  yarn
  trash-cli
  http-server
  serve
  fkill-cli
)

npm install -g "${packages[@]}"
