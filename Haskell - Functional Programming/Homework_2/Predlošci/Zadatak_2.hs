checkxo :: [String] -> Char
checkxo xo

-- Ne mijenjati funkciju main!
main :: IO()
main = do i <- getLine
          let xo = read i :: [String]
          print $ checkxo xo