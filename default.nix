{ pkgs ? import <nixpkgs> {}
}:

let
  zxcvbn-hs = import ./zxcvbn-hs.nix { inherit pkgs; };

  # Helpful if you want to override any Haskell packages:
  overrides = self: super: with pkgs.haskell.lib; {
    zxcvbn-hs = zxcvbn-hs;
  };

  # Apply the overrides from above:
  haskell = pkgs.haskellPackages.override (orig: {
    overrides = pkgs.lib.composeExtensions
      (orig.overrides or (_: _: {})) overrides; });

in haskell.callPackage ./zxcvbn-dvorak.nix { }
