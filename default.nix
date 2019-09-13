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
    rev = "788e794d3bf72a9393376d5a4c10fb942056eea6";
  };

  zxcvbn-hs = import "${fetchGit zxcvbn-hs-src}/default.nix" { inherit pkgs; };

in nix-hs {
  cabal = ./zxcvbn-dvorak.cabal;

  overrides = lib: self: super: with lib; {
    zxcvbn-hs = zxcvbn-hs;
  };
}
