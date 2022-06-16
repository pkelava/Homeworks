factorial n =

-- Molim ne mijenjajte kod ispod.
main :: IO()
main = do input <- getLine 
          let x = read input :: Integer
          print (factorial x)