quad

main :: IO()
main = do i <- getLine 
          print $ quad (read i :: Int)