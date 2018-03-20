module GimmePerson where

import Data.Either(isRight)

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
  if isRight $ mkPerson userName age 
  then putStrLn $ "Yay!  Successfully got a person: " ++  userName ++ " who is " ++ ageString ++ " years old."
  else putStrLn "Error is"
  

