euclides

-- Ne mijenjati kod funkcije main.
main :: IO()
main = do input1 <- getLine 
          input2 <- getLine
          let x = read input1 :: Int
          let y = read input2 :: Int
          print (euclides x y)