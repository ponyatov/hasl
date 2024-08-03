module Main where

import System.Environment (getArgs)

import Lib

main :: IO ()
main = do
    putStrLn "Hello, Haskell!"
    getArgs >>= print
    Lib.some
