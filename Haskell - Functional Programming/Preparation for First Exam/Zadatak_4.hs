import Data.Char

eval [] = 0
eval (s:ss) | ord s >= 48 && ord s <= 57 = (ord s - 48) + eval ss
            | otherwise = eval ss
            
-- Molimo, ne mijenjati kod ispod.
main :: IO()
main = do s <- getLine 
          print (eval s)
