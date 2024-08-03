module Main where

import System.Environment (getArgs)

import Lib

main :: IO ()
main = do
    putStrLn "Hello, Haskell!"
    getArgs >>= print
    Lib.some

square :: Num a => a -> a
square v = v * v
-- square 2
-- (+) 1 2
-- p.24
