povecat [] _ = []
povecat (g:gs) y | g == 0 = 0 : povecat gs y
                 | g >= y = [g+1] ++ povecat gs g
                 | g  < y = [g] ++ povecat gs y

day :: Int -> [Int] -> [Int]
day x g = reverse(povecat(reverse(take x g)) 0) ++ ((g !! x)+1) : povecat(drop (x+1) g) 0

main :: IO()
main = do i <- getLine
          let n = read i :: Int
          i <- getLine
          let g = read i :: [Int]
          print $ day n g