cnt

main :: IO()
main = do input1 <- getLine 
          input2 <- getLine
          let x = read input1 :: String
          let y = read input2 :: String
          print (cnt x y)