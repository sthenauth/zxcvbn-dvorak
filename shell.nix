{ pkgs ? (import <nixpkgs> {}).pkgs
}:

let
  nix-hs-src = fetchGit {
    url = "https://code.devalot.com/pjones/nix-hs.git";
    rev = "2cc803c62cdc74a9a0696cc8fa8ffa3fcb420b97";
  };

  nix-hs = (import "${nix-hs-src}/default.nix" {inherit pkgs;});

  # For the `zxcvbn-tools' command.
  zxcvbn-hs = import ./zxcvbn-hs.nix { inherit pkgs; };

in

pkgs.mkShell {
  buildInputs = with pkgs; [
    nix-hs
    zxcvbn-hs
    haskellPackages.hlint
    haskellPackages.hasktags
    # cabal-dependency-licenses
  ];
}
