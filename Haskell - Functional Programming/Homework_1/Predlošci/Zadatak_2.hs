erathostenes

-- Ne mijenjati kod funkcije main.
main :: IO()
main = do input1 <- getLine 
          let x = read input1 :: Int
          print $ erathostenes [2 .. x]