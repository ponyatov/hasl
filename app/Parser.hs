{-# LANGUAGE MultiWayIf #-}

module Parser where

import Prelude hiding (any)

any :: Char -> Bool
any _ = True

char :: Char -> Bool
char _ = True

check :: Char -> Bool
check c =
  if
    | any c -> True
    | char c -> True
    | otherwise -> False

test :: IO ()
test =
  if (check 'x') then putStrLn "ok" else putStrLn "fail"
