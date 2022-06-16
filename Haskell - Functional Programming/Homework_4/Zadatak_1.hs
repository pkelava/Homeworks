-- Ne mijenjati definiciju liste.
data List a = Elem a (List a) | Null
    deriving (Show, Read)
-- Kraj definicije.

provjeri :: (Ord a) => List a -> Bool
provjeri Null = True
provjeri (Elem a Null) = True
provjeri (Elem a (Elem c b)) | a  > c = False 
                             | otherwise = True && provjeri (Elem c b)

lsort2 :: (Ord a) => List a -> List a
lsort2 Null = Null
lsort2 (Elem a Null) = (Elem a Null)
lsort2 (Elem a (Elem c b)) | a > c = lsort2(Elem c (Elem a b))
                           | otherwise = (Elem a(lsort2(Elem c b)))

lsort :: (Ord a) => List a -> List a
lsort l | provjeri(lsort2 l) = lsort2 l
        | otherwise = lsort(lsort2 l)

-- Ne mijenjati kod funkcije main.
main :: IO()
main = do i <- getLine
          let l = read i :: List Int
          print $ lsort l