prunestr [] = ""
prunestr (x:xs) | x `elem` "aeiou02468" = prunestr xs
                | otherwise = x : prunestr xs 


main :: IO()
main = do print (prunestr "ovo je 1 string 234")