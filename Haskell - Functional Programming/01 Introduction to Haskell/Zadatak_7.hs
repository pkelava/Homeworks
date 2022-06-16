factorial 0 = 1
factorial x = x * factorial(x-1)

-- Molim ne mijenjajte kod ispod.
main :: IO()
main = do input <- getLine 
          let x = read input :: Integer
          print (factorial x)