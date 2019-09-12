{-|

Copyright:
  This file is part of the package zxcvbn-dvorak. It is subject to the
  license terms in the LICENSE file found in the top-level directory
  of this distribution and at:

    https://code.devalot.com/sthenauth/zxcvbn-dvorak

  No part of this package, including this file, may be copied,
  modified, propagated, or distributed except according to the terms
  contained in the LICENSE file.

License: MIT

Enhance the zxcvbn password strength estimation algorithm by allowing
by allowing it to detect keyboard patterns from a Dvorak layout.

-}
module Text.Password.Strength.Config.Dvorak
  ( dvorak
  ) where

--------------------------------------------------------------------------------
-- Imports:
import Control.Lens ((%~))
import qualified Text.Password.Strength.Config as Zxcvbn
import qualified Text.Password.Strength.Config.Dvorak.Generated as Generated

--------------------------------------------------------------------------------
-- | Add the Dvorak keyboard layout to an existing 'Config'.
dvorak :: Zxcvbn.Config -> Zxcvbn.Config
dvorak = Zxcvbn.keyboardGraphs %~ (Generated.dvorak:)
