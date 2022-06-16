import Data.List

provjeri [] _ [] _ = True
provjeri (x:xs) xss (y:ys) yss | xss == yss = False
                               | x `elem` yss && y `elem` xss = True && provjeri xs xss ys yss
                               | otherwise = False

uzmiRi = do i <- getLine
            let input = i :: String
            return input

igra xs x y = do i <- uzmiRi
                 if (length i) == x then (if provjeri xs xs i i then igra xs x (y+1) else return y) else return y





main :: IO()
main = do i <- getLine
          let input = i :: String
          j <- (igra input (length input) 0)
          print(j)