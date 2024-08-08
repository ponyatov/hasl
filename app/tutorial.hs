#!/usr/bin/env runhaskell
main = putStrLn "hello world"

zum :: (Num t) => [t] -> t
zum [] = 0
zum (n : ns) = n + zum ns
