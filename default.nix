{ pkgs ? import <nixpkgs> { }
}:

let
  nix-hs-src = fetchGit {
    url = "https://code.devalot.com/open/nix-hs.git";
    rev = "a2b666faf8cb3c6f769655dfb36f4695f78bc3c3";
  };

  nix-hs = import "${nix-hs-src}/default.nix" { inherit pkgs; };

in nix-hs {
  cabal = ./zxcvbn-dvorak.cabal;

  overrides = lib: self: super: with lib; {
    zxcvbn-hs = lib.fetchGit {
      url = "https://code.devalot.com/sthenauth/zxcvbn-hs.git";
      rev = "5c522f929e7aff38cb477160ec89cf854cc1ecca";
      ref = "next";
    };

    lens =
      if super ? lens_4_18
        then super.lens_4_18
        else super.lens;
  };
}
