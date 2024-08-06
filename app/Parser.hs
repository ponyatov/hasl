{-# LANGUAGE MultiWayIf #-}

module Parser where

import Prelude hiding (any)

any :: Char -> Bool
any _ = True

char :: Char -> Bool
char _ = True

test :: IO ()
test =
 putStrLn "pass"
