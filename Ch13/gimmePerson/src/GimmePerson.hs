module GimmePerson where

import Data.Either(isRight, fromRight)

type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid =
    NameEmpty
  | AgeTooLow
  | PersonInvalidUnknown String
  deriving (Eq, Show)

mkPerson :: Name
         -> Age
         -> Either PersonInvalid Person

mkPerson name age
  | name /= "" && age > 0 =
      Right $ Person name age
  | name == "" = Left NameEmpty
  | not (age > 0) = Left AgeTooLow
  | otherwise =
    Left $ PersonInvalidUnknown $
      "Name was: " ++ show name ++
      " Age was: " ++ show age    

gimmePerson :: IO ()
gimmePerson = do
  putStr "Username: "
  userName <- getLine
  putStr "Age:"
  ageString <- getLine
  let age = read ageString :: Integer
  let person = mkPerson userName age
  case person of 
    Right x  -> putStrLn $ "Yay!  Successfully got a person: " ++ (show x)
    Left  x -> putStrLn $ "Whoops " ++ (show x)

