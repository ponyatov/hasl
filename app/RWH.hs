#!/usr/bin/env runhaskell

import System.Environment (getArgs)

add a b = a + b

-- pp rwh.40
-- main = do
--     print (add 1 2)

x = 10

-- x = 11
-- print x

-- myDrop n xs =
--   if n <= 0 || null xs
--     then xs
--     else myDrop (n - 1) (tail xs)

-- rwh.52

-- | book info data structure
data BookInfo
  = Book
      -- | book's identifier
      Int
      -- | title
      String
      -- | names of its authors
      [String]
  deriving (Show)

data MagazineInfo
  = Magazine Int String [String]
  deriving (Show)

main = do
  putStrLn "Hello"
  getArgs >>= print
  print (Book 123 "Hello" [])

myInfo =
  Book
    9780135072455
    "Algebra of Programming"
    ["Richard Bird", "Oege de Moor"]
