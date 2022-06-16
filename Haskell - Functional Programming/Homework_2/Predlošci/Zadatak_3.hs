import Data.Char

encode :: String -> String
encode x 

main :: IO()
main = do i <- getLine
          let s = read i :: String
          print $ encode s