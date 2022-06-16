taylor x n 

main :: IO()
main = do i <- getLine
          let x = read i :: Double
          i <- getLine
          let n = read i :: Int
          print $ taylor x n