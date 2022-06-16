data List a = Elem a (List a) | Null
    deriving (Show, Read, Eq)
    
test :: List Int
test = Elem 5 (Elem 2 (Elem 4 (Elem 1 (Elem 3 (Null)))))
--- 5 2 4 1 3


llen :: List a -> Int
llen Null = 0
llen (Elem _ xs) = 1 + llen xs

lsum :: (Num a) => List a -> a
lsum Null = 0
lsum (Elem x xs) = x + lsum xs

lsum2 :: (Num a) => List a -> a
lsum2 Null = 0
lsum2 (Elem x xs) = (if (llen xs `mod` 2 == 1)then x else 0) + lsum xs

lsum3 :: (Num a) => List a -> a
lsum3 Null = 0
lsum3 (Elem x Null) = 0
lsum3 (Elem x (Elem y ys)) = y + lsum3 ys

l2s :: (Show a) => List a -> String
l2s Null = ""
l2s (Elem x Null) = show x ++ ""
l2s (Elem x xs) = show x ++ " " ++ l2s xs

lfoldl :: (b -> a -> b) -> b -> List a -> b
lfoldl _ p Null = p
lfoldl f p (Elem x xs) = lfoldl f (f p x)xs

lprod :: (Num a) => List a -> a
lprod = lfoldl (*) 1

l2h :: List a -> [a]
l2h = lfoldl(\a x -> a ++ [x])[]

(.+) :: List a -> List a -> List a
Null .+ l = l
l .+ Null = l
(Elem x xs) .+ l = Elem x (xs .+ l)


--lsort :: (Ord a) => List a -> List a

main :: IO()
main = do print (l2s test)
          print (llen test)
          print (lsum test)
          print (lsum2 test)
          print (lsum3 test)
          print (lprod test)
          print (l2h test)
          --print (l2s (lsort test))
          print (lfoldl (+) 0 test)
          print (l2h (test .+ test))
          print (test .+ (Elem 10(Elem 11 Null)))
          print (read "Elem 10(Elem 11 Null)" :: (List Int))