module Main where

import System.Environment (getArgs)

import Lib
import Parser
-- import AST

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  getArgs >>= print
  Lib.some
  Parser.test

square :: (Num a) => a -> a
square v = v * v

isquare :: Int -> Int
isquare v = v * v

prod :: (Num a) => a -> a -> a
prod x y = x * y

pi :: Double
pi = 3.1415

-- p.34
