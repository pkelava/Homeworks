main :: IO()
main = do let a = [1, 2, 3, 4]
          let b = [5, 6, 7, 8]
          print "funkcija head"
          print (head a) 
          print "funkcija tail"
          print (tail a)
          print "funkcija take"
          print (take 2 a) 
          print "funkcija drop"
          print (drop 1 a)
          print "funkcija length"
          print (length a)
          print "funkcija sum"
          print (sum a)
          print "funkcija product"
          print (product a)
          print "funkcija reverse"
          print (reverse a)
          print "konkatenacija liste"
          print (a ++ b)