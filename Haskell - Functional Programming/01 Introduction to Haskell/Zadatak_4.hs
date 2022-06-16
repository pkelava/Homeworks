sumlist [] = 0
sumlist  (x:xs)= x + sumlist xs


main :: IO()
main =  do input <- getLine
           let x = read input :: [Int]
           print(sumlist x)