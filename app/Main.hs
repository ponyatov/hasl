module Main where

import System.Environment (getArgs)

main :: IO ()
main = do
    putStrLn "Hello, Haskell!"
    getArgs >>= print
