qsort [] = []
qsort (x:xs) | mod x 2 == 1 = qsort[y | y <- xs, mod y 2 == 1 && y < x] ++ qsort[t | t <- xs,mod t 2 == 1 && t == x] ++ x : qsort[z | z <- xs, mod z 2 == 1 && z > x] ++ qsort [u| u <- xs, mod u 2 == 0]
             | otherwise = qsort[i | i <- xs, mod i 2 == 1] ++ qsort[o | o <- xs, mod o 2 == 0 && o > x] ++ x :qsort[l | l <- xs, mod l 2 == 0 && l == x] ++ qsort[p | p <- xs,mod p 2 == 0 && p < x]


search x (y:ys) z | length [k | k <- x, mod k z == y] == 0 = search x ys z
                  | otherwise = y

sort [] _ = []
sort x y = qsort[k | k <- x, mod k y == search x [0 .. (y-1)] y] ++ sort [j | j <- x, mod j y > search x [0 .. (y-1)] y]y



-- Ne mijenjati kod funkcije main.
main :: IO()
main = do a <- getLine 
          b <- getLine
          print $ sort (read a :: [Int]) (read b :: Int)