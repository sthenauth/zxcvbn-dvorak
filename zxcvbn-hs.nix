{ pkgs ? import <nixpkgs> { }
}:

let
  src = {
    url = "https://code.devalot.com/sthenauth/zxcvbn-hs.git";
    rev = "788e794d3bf72a9393376d5a4c10fb942056eea6";
  };

  drv = import "${fetchGit src}/default.nix" { inherit pkgs; };

in
  pkgs.haskell.lib.overrideCabal drv
    (_: {configureFlags = [ "-ftools" ];})
