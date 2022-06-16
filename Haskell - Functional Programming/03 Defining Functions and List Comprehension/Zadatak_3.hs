sprod [] [] = 0
sprod (x:xs)(y:ys) = x*y + sprod xs ys 

main :: IO()
main = do print (sprod [1, 2] [3, 4])