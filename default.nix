{ pkgs ? import <nixpkgs> { }
}:

let
  nix-hs-src = fetchGit {
    url = "https://code.devalot.com/open/nix-hs.git";
    rev = "2003332a1e8e518b54e6143f9a9467a8a05abca4";
  };

  nix-hs = import "${nix-hs-src}/default.nix" { inherit pkgs; };

  zxcvbn-hs-src = {
    url = "https://code.devalot.com/sthenauth/zxcvbn-hs.git";
    rev = "07a224794f0299e4c066056841485e2d86d8b075";
  };

  zxcvbn-hs = import "${fetchGit zxcvbn-hs-src}/default.nix" { inherit pkgs; };

in nix-hs {
  cabal = ./zxcvbn-dvorak.cabal;

  overrides = lib: self: super: with lib; {
    zxcvbn-hs = zxcvbn-hs;
  };
}
