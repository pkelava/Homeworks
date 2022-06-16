data List a = Elem a (List a) | Null

test :: List Int
test = Elem 5 (Elem 2 (Elem 4 (Elem 1 (Elem 3 (Null)))))

---

llen :: List a -> Int

lsum :: (Num a) => List a -> a

l2s :: (Show a) => List a -> String

lfoldl :: (b -> a -> b) -> b -> List a -> b

lprod :: (Num a) => List a -> a

l2h :: List a -> [a]

lsort :: (Ord a) => List a -> List a

main :: IO()
main = do print (l2s test)
          print (llen test)
          print (lsum test)
          print (lprod test)
          print (l2h test)
          print (l2s (lsort test))