data WhoCares a =
    ItDoesnt
  | Matter a
  | WhatThisIsCalled
  deriving (Eq, Show)

instance Functor WhoCares where
  fmap _ ItDoesnt = WhatThisIsCalled
  fmap f WhatThisIsCalled = ItDoesnt
  fmap f (Matter a) = Matter (f a)

-- data CountingBad a =
--   Heisenberg Int a
--   deriving (Eq, Show)

-- instance Functor CountingBad where
--   fmap f (Heisenberg n a) =
--     Heisenberg (n+1) (f a)

data CountingGood a =
  Heisenberg Int a
  deriving (Eq, Show)

instance Functor CountingGood where
  fmap f (Heisenberg n a) =
    Heisenberg (n) (f a)