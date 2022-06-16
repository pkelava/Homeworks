f n m = 

-- Ne mijenjati kod funkcije main.
main :: IO()
main = do a <- getLine 
          b <- getLine
          print $ f (read a :: Int) (read b :: Int)