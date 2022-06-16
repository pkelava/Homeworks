data Tree a = Node (Tree a) a (Tree a) | Null

test :: Tree Int
test = Node (Node (Node Null 4 Null) 6 (Node Null 3 Null)) 7 (Node (Node Null 2 Null) 5 (Node Null 1 Null))

list :: [Int]
list = [4, 5, 2, 1, 7, 6, 3]

---

dfs :: (b -> b -> a -> b) -> b -> Tree a -> b
dfs _ p Null = p
dfs f p (Node l v r) = f k1 k2 v
                       where k1 = dfs f p l
                             k2 = dfs f p r

tsize :: Tree a -> Int                             

preorder :: (Show a) => Tree a -> String

inorder :: (Show a) => Tree a -> String

postorder :: (Show a) => Tree a -> String

exists :: (Eq a) => a -> Tree a -> Bool

tmax :: (Ord a) => Tree a -> a

-- diplomski studij

insert :: (Ord a) => a -> Tree a -> Tree a

l2bst :: (Ord a) => [a] -> Tree a

sortedbst :: (Show a, Ord a) => Tree a -> String

minbst :: (Ord a) => Tree a -> a

main :: IO()
main = do print (tsize test)
          print (preorder test)
          print (inorder test)
          print (postorder test) 
          print (exists 2 test)
          print (exists 10 test)
          print (tmax test)
          ---
          print (sortedbst $ l2bst list)
          print (minbst $ l2bst list)
          