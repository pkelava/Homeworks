provjera [] = ["N"]
provjera x | all(=="X")(take 3 x) = ["X"]
               | all(=="O")(take 3 x) = ["O"]
               | otherwise = provjera (drop 3 x)

prva [] = []
prva (x:xs) = provjera([[head x]] ++ prva xs ++ [[last x]])

treca [] = []
treca (x:xs) = provjera([[x !! 1]] ++ treca xs)

druga [] = []
druga (x:xs) | provjera([[k] | k <- x] ++ druga xs) == ["X"] || provjera([[k] | k <- x] ++ druga xs) == ["O"] = provjera([[k] | k <- x] ++ druga xs)
             | otherwise = ["N"]


cetvrta (x:xs) = provjera([[head x]] ++ [[(head xs) !! 1]] ++ [[(xs !! 1) !! 2]])
peta (x:xs) = provjera([[x !! 2]] ++ [[(head xs) !! 1]] ++ [[(xs !! 1) !! 0]])

             

checkxo x | druga x == ["X"] = "X"
          | prva x == ["X"] = "X"
          | treca x == ["X"] = "X"
          | cetvrta x == ["X"] = "X"
          | peta x == ["X"] = "X"
          | prva x == ["O"] = "O"
          | druga x == ["O"] = "O"
          | treca x == ["O"] = "O"
          | cetvrta x == ["O"] = "O"
          | peta x == ["O"] = "O"
          | otherwise = "N"

-- Ne mijenjati funkciju main!
main :: IO()
main = do i <- getLine
          let xo = read i :: [String]
          print $ checkxo xo