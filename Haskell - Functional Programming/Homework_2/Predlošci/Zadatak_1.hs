i2b n

sumb m n

-- Ne mijenjati kod funkcije main.
main :: IO()
main = do i <- getLine 
          j <- getLine
          let m = read i :: Int
          let n = read j :: Int
          print $ sumb (i2b m) (i2b n)