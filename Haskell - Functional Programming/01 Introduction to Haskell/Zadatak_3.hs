absolute x | x < 0 = -1*x
           | otherwise = x

-- Molim ne mijenjajte kod ispod.
main :: IO()
main = do input <- getLine 
          let x = read input :: Float
          print (absolute x)