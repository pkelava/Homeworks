-- Ne mijenjati definiciju liste.
data List a = Elem a (List a) | Null
    deriving (Show, Read)
-- Kraj definicije.

lsort :: (Ord a) => List a -> List a

-- Ne mijenjati kod funkcije main.
main :: IO()
main = do i <- getLine
          let l = read i :: List Int
          print $ lsort l