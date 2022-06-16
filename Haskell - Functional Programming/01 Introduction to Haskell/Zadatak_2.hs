
poly x = x^2 + 3*x -1

-- Molim ne mijenjajte kod ispod.
main :: IO()
main = do input <- getLine 
          let x = read input :: String
          print (poly x)
          