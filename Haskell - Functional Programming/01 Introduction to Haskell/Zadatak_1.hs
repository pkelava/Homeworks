quad x = 4*x

main :: IO()
main = do input1 <- getLine
          let i = read input1 :: Int
          print $ (quad i)
