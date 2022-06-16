f1 x | x < 1 = 0  
     | mod x 2 == 0 = div x 2 
     | otherwise = -1*(div(x-1) 2) 


f2 x = map(f1) x



main :: IO()
main = do print (f2 [1, 2, 3, 4])