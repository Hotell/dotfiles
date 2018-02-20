 #!/usr/bin/env bash


 # Globally install with npm

packages=(
  npm
  trash-cli
  http-server
  serve
  fkill-cli
)

npm install -g "${packages[@]}"
