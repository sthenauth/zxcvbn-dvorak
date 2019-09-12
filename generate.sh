#! /usr/bin/env nix-shell
#! nix-shell -i bash
# shellcheck shell=bash

zxcvbn-tools \
  adjacency \
  --module "Text.Password.Strength.Config.Dvorak.Generated" \
  data/keyboards/en-US/dvorak.txt \
  "$@" > src/Text/Password/Strength/Config/Dvorak/Generated.hs

# Local Variables:
#   mode: sh
#   sh-shell: bash
# End:
