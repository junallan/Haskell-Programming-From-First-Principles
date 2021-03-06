module Palindrome where

import Control.Monad(forever)
import System.Exit(exitSuccess)  

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  case (line1 == reverse line1) of
    True -> putStrLn "It's a palindrome"
    False -> do putStrLn "Nope!"
                exitSuccess