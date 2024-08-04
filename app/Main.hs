module Main where

import Lib
import System.Environment (getArgs)

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  getArgs >>= print
  Lib.some

square :: (Num a) => a -> a
square v = v * v

isquare :: Int -> Int
isquare v = v * v

-- square 2
-- (+) 1 2
-- p.28
