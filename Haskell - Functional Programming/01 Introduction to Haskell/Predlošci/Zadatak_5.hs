sumnums a b = 

sumlist (x:xs) = x + sumlist xs
sumlist []     = 0

-- Molim ne mijenjajte kod ispod.
main :: IO()
main = do input <- getLine 
          let x = read input :: (Int, Int)
          print (sumnums (fst x) (snd x))