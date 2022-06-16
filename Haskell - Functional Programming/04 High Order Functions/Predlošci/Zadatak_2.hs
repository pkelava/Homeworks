len xs = 

main :: IO()
main = do print (len [1, 2, 3, 4, 5])
          print (len [])
          print (len [1..10000])