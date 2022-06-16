izbaci [] _ = []
izbaci (x:xs) y |  notElem x "aeiou" && x /= ' ' && y == 2 = izbaci xs 0
                | notElem x "aeiou" && x /= ' ' = x : izbaci xs (y+1)
                | otherwise = x : izbaci xs y
                
poduplaj [] = []
poduplaj (x:xs) | elem x "aeiou" = replicate 2 x ++ poduplaj xs
                | otherwise = x : poduplaj xs


f x = poduplaj(izbaci x 0)

-- Molimo, ne mijenjati kod ispod.
main :: IO()
main = do s <- getLine 
          print (f s)
          
          
abc = [a:b:c:"" | a <- "xyz",b <- "xyz",c <- "xyz"]


encode [] = "|"
encode (x:xs) = "|" ++ (abc!!((ord x) - (ord 'a'))) ++ encode xs