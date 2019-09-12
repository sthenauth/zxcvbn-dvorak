{ pkgs ? (import <nixpkgs> {}).pkgs
}:

let
  # For the `zxcvbn-tools' command.
  zxcvbn-hs = import ./zxcvbn-hs.nix { inherit pkgs; };

  # This package
  zxcvbn-dvorak = import ./default.nix { inherit pkgs; };

in

pkgs.mkShell {
  buildInputs = with pkgs; [
    zxcvbn-hs
    haskellPackages.hlint
    haskellPackages.hasktags
    # cabal-dependency-licenses

    (haskellPackages.ghcWithPackages (hspkgs: [
      zxcvbn-dvorak
      hspkgs.cabal-install
    ]))
  ];
}
