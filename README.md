What?
-----

This package enhances the [zxcvbn][zxcvbn-hs] password strength
estimation algorithm by allowing it to detect keyboard patterns made
with a Dvorak layout.

It also serves as an example of how to generate a keyboard layout for
[zxcvbn-hs][].

How to Use this Package
-----------------------

Let's say you want to add the Dvorak keyboard layout to the default
`en_US` config:

```haskell
import Text.Password.Strength.Config
import Text.Password.Strength.Config.Dvorak

myConfig :: Config
myConfig = dvorak en_US
```

How this Package is Put Together
--------------------------------

Essentially:

  1. Edit the raw layout file in `data/keyboards/en-US/dvorak.txt`

  2. Turn that into Haskell with `generate.sh`


**NOTE:** The `generate.sh` script requires [Nix][] to be installed.

[zxcvbn-hs]: https://code.devalot.com/sthenauth/zxcvbn-hs
[nix]: https://nixos.org/nix/download.html
