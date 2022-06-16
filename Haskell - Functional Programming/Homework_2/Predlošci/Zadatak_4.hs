day :: Int -> [Int] -> [Int]
day x g = 

main :: IO()
main = do i <- getLine
          let n = read i :: Int
          i <- getLine
          let g = read i :: [Int]
          print $ day n g