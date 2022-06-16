import Data.Char

s2i 

main :: IO()
main = do i <- getLine
          let s = read i :: String
          print $ s2i s