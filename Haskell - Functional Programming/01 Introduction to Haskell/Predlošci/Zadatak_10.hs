merge :: 

-- Molim ne mijenjajte kod ispod.
main :: IO()
main = do input <- getLine 
          let x = read input :: [Int]
          let n = length x
          let a = take (n `div` 2) x
          let b = drop (n `div` 2) x
          print (merge a b)