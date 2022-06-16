sum' xs = foldr(+) 0 xs

main :: IO()
main = do print (sum' [1, 2, 3, 4])
          print (sum' [100])
          print (sum' [])
          print (sum' [1..100])