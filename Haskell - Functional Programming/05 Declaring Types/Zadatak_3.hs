data Tree a = Node (Tree a) a (Tree a) | Null

test :: Tree Int
test = Node (Node (Node Null 4 Null) 6 (Node Null 3 Null)) 7 (Node (Node Null 2 Null) 5 (Node Null 1 Null))

list :: [Int]
list = [4, 5, 2, 1, 7, 6, 3]

---

dfs :: (b -> a -> b -> b) -> b -> Tree a -> b
dfs _ p Null = p
dfs f p (Node l v r) = f k1 v k2
                       where k1 = dfs f p l
                             k2 = dfs f p r


tsize2 :: Tree a -> Int
tsize2 Null = 0
tsize2 (Node l _ r) = 1 + tsize2 l + tsize2 r


tsize :: Tree a -> Int          
tsize = dfs(\l _ r -> l + r + 1)0 

fix a = if (a == "") then "" else " "

preorder :: (Show a) => Tree a -> String
preorder = dfs(\l v r -> show v ++ fix l ++ l ++ fix r ++ r) ""


inorder :: (Show a) => Tree a -> String
inorder = dfs(\l v r -> l ++ fix l ++ show v ++ fix r ++ r) ""


postorder :: (Show a) => Tree a -> String
postorder = dfs (\l v r -> l ++ fix l ++ r ++ fix r ++ show v) ""


exists :: (Eq a) => a -> Tree a -> Bool
exists a t = dfs(\l v r -> l || v == a || r ) False t


tmax :: (Ord a) => Tree a -> a
tmax t@(Node _ v _) = dfs (\l e r -> maximum [l,e,r]) v t 

{-
-- diplomski studij

insert :: (Ord a) => a -> Tree a -> Tree a

l2bst :: (Ord a) => [a] -> Tree a

sortedbst :: (Show a, Ord a) => Tree a -> String

minbst :: (Ord a) => Tree a -> a
-}

main :: IO()
main = do print (tsize2 test)
          print (tsize test)
          print (preorder test)
          print (inorder test)
          print (postorder test) 
          print (exists 2 test)
          print (exists 10 test)
          print (tmax test)
          ---
          --print (sortedbst $ l2bst list)
          --print (minbst $ l2bst list)
          