{ mkDerivation, base, base64-bytestring, binary, binary-orphans
, containers, lens, stdenv, text, unordered-containers, zlib
, zxcvbn-hs
}:
mkDerivation {
  pname = "zxcvbn-dvorak";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [
    base base64-bytestring binary binary-orphans containers lens text
    unordered-containers zlib zxcvbn-hs
  ];
  homepage = "https://code.devalot.com/sthenauth/zxcvbn-dvorak";
  description = "Password strength estimation based on zxcvbn";
  license = stdenv.lib.licenses.mit;
}
