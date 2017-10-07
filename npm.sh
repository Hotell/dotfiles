 #!/usr/bin/env bash


 # Globally install with npm

packages=(
  npm
  trash-cli
  http-server
)

npm install -g "${packages[@]}"
