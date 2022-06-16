import Data.Char

provjeri x | ord x >= 48 && ord x <= 57 = [x]
           | otherwise = ""

s2i y | length[k | k <- y, ord k >= 48 && ord k <= 57 ] == 0 = "0"
      | otherwise = foldr(\ x z -> (provjeri x) ++ z) "" y

main :: IO()
main = do i <- getLine
          let s = read i :: String
          print $ s2i s