import Data.List -- funkcija sort
import Data.Char -- funkcije ord i chr

prva _ 123 = []
prva x y  | length [k | k <- x, k == chr y] > 0 = [filter(==chr y) x] ++ prva x (y+1) 
          | otherwise = prva x (y+1)
      
thirdfreq s =  head(drop 2 (reverse(sort(map(length)(prva s 97)))))

-- Molimo, ne mijenjati kod ispod.
main :: IO()
main = do s <- getLine 
          print (thirdfreq s)