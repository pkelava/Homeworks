len xs = foldl(\ x z -> 0 + z) 1 xs

main :: IO()
main = do print (len [1, 2, 3, 4, 5])
          print (len [])
          print (len [1..10000])