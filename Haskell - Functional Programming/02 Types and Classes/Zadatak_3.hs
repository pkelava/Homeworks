g(x : xs) (l : ls) | x /= ' ' = g xs ((l ++ [x]) : ls)
                   | otherwise = g xs([]: l : ls)
g [] l = l

fja r = (l, n,if(n `mod` 2 == 0) then False else True)
        where l = reverse (g r [[]])
              n = length l           

main :: IO()
main = do print (fja "Ovo je kolegij funkcijsko programiranje")