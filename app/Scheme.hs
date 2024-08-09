#!/usr/bin/env runhaskell

-- Write Yourself a Scheme in 48 Hours

module Main where

import System.Environment

main :: IO ()
main = do
  args <- getArgs
--   putStrLn ("Hello, " ++ args !! 0)
