check x | x < 1 = 0
        | mod x 2 == 0 = div x  2
        | otherwise = -1*(div (x-1) 2)

main :: IO()
main = do print (check 3)
          print (check 4)
          print (check 0)
          print (check (-5))