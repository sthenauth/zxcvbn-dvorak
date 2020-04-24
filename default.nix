{ sources ? import ./nix/sources.nix
, pkgs ? import sources.nixpkgs { }
, nix-hs ? import sources.nix-hs { inherit pkgs; }
, zxcvbn-hs ? sources.zxcvbn-hs
, ghcide ? sources.ghcide-nix
, ormolu ? sources.ormolu
, ghc ? "default"
}:

nix-hs {
  cabal = ./zxcvbn-dvorak.cabal;
  compiler = ghc;

  overrides = lib: self: super: with lib; {
    zxcvbn-hs = import zxcvbn-hs {
      inherit (lib) pkgs;
      inherit ghc;
    };

    ghcide = import ghcide {};

    ormolu = (import ormolu {
      inherit (lib) pkgs;
      ormoluCompiler = lib.compilerName;
    }).ormolu;
  };
}
