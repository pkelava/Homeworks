erathostenes [] = []
erathostenes(x:xs)  | length [ k | k <- [2..x], x `mod` k == 0] == 1 = x : erathostenes xs
                    |otherwise = erathostenes xs


-- Ne mijenjati kod funkcije main.
main :: IO()
main = do input1 <- getLine 
          let x = read input1 :: Int
          print $ erathostenes [2 .. x]