#!/usr/bin/env runhaskell

-- Real World Haskell

-- file: ch01/WC.hs
-- lines beginning with "--" are comments.
main = interact wordCount
  where
    wordCount input = show (length (lines input)) ++ "\n"

-- rwh.27
