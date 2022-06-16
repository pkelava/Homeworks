eval s

-- Molimo, ne mijenjati kod ispod.
main :: IO()
main = do s <- getLine 
          print (eval s)