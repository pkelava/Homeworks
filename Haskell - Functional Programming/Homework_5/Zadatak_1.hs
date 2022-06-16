provjera :: String -> Bool
provjera [] = True
provjera (x:xs) | x `elem` "[]{}()" = True && provjera xs
                | otherwise = False

zagrade :: String -> Bool
zagrade [] = True
zagrade x | (length x) `mod` 2 /= 0 = False
          | head x == '(' = if (length(takeWhile(/= ')') x) + 1) `mod` 2 == 0 then True && zagrade (drop 1 (dropWhile(/=')') x)) else False
          | head x == '[' = if (length(takeWhile(/= ']') x) + 1) `mod` 2 == 0 then True && zagrade (drop 1 (dropWhile(/=']') x)) else False
          | head x == '{' = if (length(takeWhile(/= '}') x) + 1) `mod` 2 == 0 then True && zagrade (drop 1 (dropWhile(/='}') x)) else False

glavna :: String -> Bool
glavna x | (provjera x) = zagrade x
         | otherwise = False

main :: IO()
main = do x <- getLine
          let input1 = x :: String
          print(glavna input1)