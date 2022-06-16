lrec x = length x

funkcija x = lrec x 

main :: IO()
main = do print (funkcija [1, 2, 3])
          print (lrec [1, 2, 3])