izbacuj [] _ _ = []
izbacuj (x:xs) y l | x == y && l > 0 = izbacuj xs y (l-1)
                   | x /= 2 || l == 0 = x : izbacuj xs y l

remove2 x l | length [k | k <- x, k == 2] >= 2 = izbacuj x l 2
            | otherwise = x
        

main :: IO()
main = do print (remove2 [1, 2, 2, 3] 2)
