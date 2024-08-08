#!/usr/bin/env runhaskell

main = putStrLn "hello world"

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

-- p.30

double x = x + x

quadruple x = double (double x)

quadruple 10
