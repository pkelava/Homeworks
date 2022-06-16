modulo a b = a `mod` b

-- Molim ne mijenjajte kod ispod.
main :: IO()
main = do input <- getLine 
          let x = read input :: (Int, Int)
          print (modulo (fst x) (snd x))