import Data.Monoid
import Test.QuickCheck

monoidAssoc :: (Eq m, Monoid m)
            => m -> m -> m -> Bool

monoidAssoc a b c =
  (a <> (b <> c)) == ((a <> b) <> c)

data Optional a =
    Nada
  | Only a
  deriving (Eq, Show)

instance Monoid a
      => Monoid (Optional a) where
  mempty = Nada
  mappend a b= a <> b



--   instance Monoid b => Monoid (a -> b)
-- instance (Monoid a, Monoid b)
-- => Monoid (a, b)
-- instance (Monoid a, Monoid b, Monoid c)
-- => Monoid (a, b, c)