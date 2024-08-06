{-# LANGUAGE MultiWayIf #-}

module Parser where

import Test.HUnit

import Prelude hiding (any)

any :: Char -> Bool
any _ = True

testAny = TestCase (assert (any 'x'))

tests = TestList []

char :: Char -> Bool
char _ = True

check :: Char -> Bool
check c =
  if
    | any c -> True
    | char c -> True
    | otherwise -> False

test :: IO ()
test = do
  if check 'x' then putStrLn "ok" else putStrLn "falt"
