cnt :: String -> String -> Int -> [Int]
cnt (a:as)(b:bs) n | a == b = n : cnt as bs (n+1)
                   |otherwise = cnt as bs (n+1)
cnt [] [] _ = []

main :: IO()
main = do input1 <- getLine 
          input2 <- getLine
          let x = read input1 :: String
          let y = read input2 :: String
          print (cnt x y 0)