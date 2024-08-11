add a b = a + b

add a b = a + b

-- pp rwh.40
-- main = do
--     print (add 1 2)

x = 10

-- x = 11
-- print x

myDrop n xs =
  if n <= 0 || null xs
    then xs
    else myDrop (n - 1) (tail xs)

-- rwh.52
