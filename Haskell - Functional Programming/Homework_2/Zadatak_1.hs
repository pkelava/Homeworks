i2b 0 = "0"
i2b 1 = "1"
i2b m | m `mod` 2 == 0 = i2b (div m 2) ++ "0"
      | otherwise = i2b (div m 2) ++ "1"

zbroji [] [] 0 = []
zbroji [] [] 1 = "1"
zbroji (x:xs) (y:ys) n | x =="1" && y == "1" && n == 1 = "1" ++ zbroji xs ys 1
                       | x =="1" && y == "0" && n == 1 = "0" ++ zbroji xs ys 1
                       | x =="0" && y == "1" && n == 1 = "0" ++ zbroji xs ys 1
                       | x =="0" && y == "0" && n == 1 = "1" ++ zbroji xs ys 0
                       | x =="1" && y == "1" && n == 0 = "0" ++ zbroji xs ys 1
                       | x =="1" && y == "0" && n == 0 = "1" ++ zbroji xs ys 0
                       | x =="0" && y == "1" && n == 0 = "1" ++ zbroji xs ys 0
                       | x =="0" && y == "0" && n == 0 = "0" ++ zbroji xs ys 0
                    
sumb m n | length m > length n = sumb m ("0"++n)
         | length n > length m = sumb ("0"++m) n
         | otherwise = reverse (zbroji(reverse[[k] | k <- m]) (reverse[[y] | y <- n]) 0)

-- Ne mijenjati kod funkcije main.
main :: IO()
main = do i <- getLine 
          j <- getLine
          let m = read i :: Int
          let n = read j :: Int
          print $ sumb (i2b m) (i2b n)