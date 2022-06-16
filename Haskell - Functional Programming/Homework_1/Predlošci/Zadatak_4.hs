qsort (x : xs) = qsort a ++ x : qsort b
                 where a = [y | y <- xs, x <= y]
                       b = [y | y <- xs, x > y]
qsort [] _ = [] 

sort

-- Ne mijenjati kod funkcije main.
main :: IO()
main = do a <- getLine 
          b <- getLine
          print $ sort (read a :: [Int]) (read b :: Int)