g [] l= l
g(x : xs) (l : ls) | x /= ' ' = g xs ((l ++ [x]) : ls)
                   | otherwise = g xs([]: l : ls)

usporedi x |mod (length(g x [[]])) 2 == 1 = [(reverse(g x [[]])) !! k | k <- [0,2 .. (length(g x [[]])-1)]]
           | otherwise = [(reverse(g x [[]])) !! k | k <- [0,2 .. (length(g x [[]])-2)]]
           
pal x |length(g x [[]]) > 2 = (if(concat(usporedi x) == concat(usporedi(reverse x))) then True else False)
      |otherwise = if((head (g (reverse x) [[]])) == reverse(head (g (reverse x) [[]]))) then True else False

-- Ne mijenjati kod funkcije main.
main :: IO()
main = do a <- getLine 
          print $ pal (read a :: String)
          
          