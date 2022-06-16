sort [] = []
sort xs = m : sort [x | x <- xs, x /= m]
          where m = minimum xs

main :: IO()
main = do print (sort [3, 1, 2,-2, 5, 7, 9])