#!/usr/bin/env runhaskell
main = putStrLn "hello world"

zum :: (Num t) => [t] -> t
zum [] = 0
zum (n : ns) = n + zum ns

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort [x] = [x]
qsort (x : xs) = qsort smaller ++ [x] ++ qsort larger
  where
    smaller = [a | a <- xs, a <= x]
    larger = [b | b <- xs, b > x]

seqn :: (Monad m) => [m a] -> m [a]
-- seqn :: [IO a] -> IO [a]
seqn [] = return []
seqn (act : acts) = do
  x <- act
  xs <- seqn acts
  return (x : xs)
