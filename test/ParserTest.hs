module MainTest where

import Parser
import qualified System.Exit as Exit
import Test.HUnit

testAny :: Test
testAny = TestCase (assert (any 'x'))

testChar :: Test
testChar = TestCase (assert (char 'x'))

tests :: Test
tests =
  TestList
    [ TestLabel "any" testAny,
      TestLabel "char" testChar
    ]

main = do
  result <- runTestTT tests
  if failures result > 0 then Exit.exitFailure else Exit.exitSuccess
