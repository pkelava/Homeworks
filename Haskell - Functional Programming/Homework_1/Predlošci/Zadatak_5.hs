pal

-- Ne mijenjati kod funkcije main.
main :: IO()
main = do a <- getLine 
          print $ pal (read a :: String)