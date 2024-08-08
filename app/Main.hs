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

zum :: (Num t) => [t] -> t
zum [] = 0
zum (n : ns) = n + zum ns

double :: (Num a) => a -> a
double x = x + x

square :: (Num a) => a -> a
square v = v * v

isquare :: Int -> Int
isquare v = v * v

prod :: (Num a) => a -> a -> a
prod x y = x * y

pi :: Double
pi = 3.1415

-- p.38
