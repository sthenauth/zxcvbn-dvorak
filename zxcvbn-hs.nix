{ pkgs ? import <nixpkgs> { }
}:

let
  src = {
    url = "https://code.devalot.com/sthenauth/zxcvbn-hs.git";
    rev = "cf089bef42f922e697146dc29e0122537102d1e9";
  };

  drv = import "${fetchGit src}/default.nix" { inherit pkgs; };

in
  pkgs.haskell.lib.overrideCabal drv
    (_: {configureFlags = [ "-ftools" ];})
