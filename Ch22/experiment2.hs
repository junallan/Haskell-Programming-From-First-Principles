module Web.Shipping.Utils ((<||>)) where

import Control.Applicative (liftA2)

boop = (*2)
doop = (+10)

(<||>) :: (a -> Bool) -> (a -> Bool) -> a -> Bool
(<||>) = liftA2 (||)

boopDoop :: Integer -> Integer
boopDoop = do
  a <- boop
  b <- doop
  return (a + b)