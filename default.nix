{ sources ? import ./nix/sources.nix, pkgs ? import sources.nixpkgs { }
, nix-hs ? import sources.nix-hs { inherit pkgs; }
, zxcvbn-hs ? sources.zxcvbn-hs, ghc ? "default" }:

nix-hs {
  cabal = ./zxcvbn-dvorak.cabal;
  compiler = ghc;

  overrides = lib: self: super:
    with lib; {
      zxcvbn-hs = import zxcvbn-hs {
        inherit (lib) pkgs;
        inherit nix-hs ghc;
      };
    };
}
