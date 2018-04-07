module Main where

import Test.QuickCheck
import Test.QuickCheck.Gen (oneof)

data Trivial =
  Trivial
  deriving (Eq, Show)

data Identity a =
  Identity a
  deriving (Eq, Show)
  
data Pair a b =
  Pair a b
  deriving (Eq, Show)

data Sum a b =
    First a
  | Second b
  deriving (Eq, Show)  
  
trivialGen :: Gen Trivial
trivialGen =
  return Trivial
  
identityGen :: Arbitrary a =>
               Gen (Identity a)

identityGenInt :: Gen (Identity Int)
identityGenInt = identityGen
                              
pairGen :: (Arbitrary a,
            Arbitrary b) =>
           Gen (Pair a b)  

sumGenEqual :: (Arbitrary a,
                Arbitrary b) =>
               Gen (Sum a b)

sumGenEqual = do
  a <- arbitrary
  b <- arbitrary
  oneof [return $ First a,
         return $ Second b]

sumGenCharInt :: Gen (Sum Char Int)
sumGenCharInt = sumGenEqual

sumGenFirstPls :: (Arbitrary a,
                   Arbitrary b) =>
                  Gen (Sum a b)

sumGenFirstPls = do
  a <- arbitrary
  b <- arbitrary
  frequency [(10, return $ First a),
             (1, return $ Second b)]

sumGenCharIntFirst :: Gen (Sum Char Int)
sumGenCharIntFirst = sumGenFirstPls




instance Arbitrary Trivial where
  arbitrary = trivialGen

instance Arbitrary a =>
         Arbitrary (Identity a) where
  arbitrary = identityGen

instance (Arbitrary a,
          Arbitrary b) =>
         Arbitrary (Pair a b) where
  arbitrary = pairGen  

-- instance Arbitrary a =>
--          Arbitrary (Maybe a) where
--   arbitrary =
--     frequency [(1, return Nothing),
--                (3, liftM Just arbitrary)]  

identityGen = do
  a <- arbitrary
  return (Identity a)    

pairGen = do
  a <- arbitrary
  b <- arbitrary
  return (Pair a b)

pairGenIntString :: Gen (Pair Int String)
pairGenIntString = pairGen  

main :: IO ()
main = do
  sample trivialGen
