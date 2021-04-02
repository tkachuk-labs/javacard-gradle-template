#!/bin/sh

echo "starting nixos container..."
docker run -it --rm \
  -e NIXPKGS_ALLOW_BROKEN=1 \
  -e ROBOT_SSH_KEY="$ROBOT_SSH_KEY" \
  -v "$(pwd):/app" \
  -v "nix:/nix" \
  -v "nix-19.09-root:/root" \
  -w "/app" nixos/nix:2.3 sh -c "
  ./nix/bootstrap.sh &&
  nix-shell ./nix/shell.nix --pure \
   --argstr vimBackground $VIM_BACKGROUND \
   --argstr vimColorScheme $VIM_COLOR_SCHEME \
   --argstr gitAuthorName $GIT_AUTHOR_NAME \
   --argstr gitAuthorEmail $GIT_AUTHOR_EMAIL \
   -v --show-trace
  "
