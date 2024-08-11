#!/usr/bin/env runhaskell

-- Write Yourself a Scheme in 48 Hours

module Main where

import System.Environment

main :: IO ()
main = do
  args <- getArgs
  putStrLn (show args)

--   putStrLn ("Hello, " ++ args !! 0)

-- oh.52
