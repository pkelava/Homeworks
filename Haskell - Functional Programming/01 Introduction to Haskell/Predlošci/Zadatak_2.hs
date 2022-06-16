poly x = -- Ovdje pisite vas kod.

-- Molim ne mijenjajte kod ispod.
main :: IO()
main = do input <- getLine 
          let x = read input :: Float
          print (poly x)