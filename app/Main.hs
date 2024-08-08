module Main where

import Lib
import Parser
import System.Environment (getArgs)

-- import AST

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  getArgs >>= print
  Lib.some
  Parser.test

-- p.38
