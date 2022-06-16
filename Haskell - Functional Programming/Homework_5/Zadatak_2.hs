-- Ne mijenjati definiciju liste.
data List a = Elem a (List a) | Null
    deriving Show
-- Kraj definicije.

zadnja [] = Null
zadnja (x:xs) = Elem (x*2) (zadnja xs)

lista [] = []
lista x | head x /= ' ' = takeWhile (/=' ') x : (lista (dropWhile (/= ' ') x))
        | otherwise = lista (tail x)

pretvori2 x = zadnja(map(\ x -> read x :: Int)(lista (dropWhile (==' ') x)))

pretvori x = pretvori2(filter (\ x -> x `notElem` "ElemNull()") x)

getList :: IO (List Int)
getList =do x <- getLine
            let input1 = x :: String
            return (pretvori input1)
             
-- Ne mijenjati funkciju main.
main :: IO()
main = do l <- getList
          print l