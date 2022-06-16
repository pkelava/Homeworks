isSpace :: Char -> Bool
isSpace c = c `elem` [' ', '\n', '\t']
                  
fja [] = ""                  
fja (x:xs) | isSpace x = fja xs
           | otherwise = x : fja xs
                  
getWord :: IO String
getWord = do x <- getLine
             let input1 = read x :: String
             return (fja input1)
             


main :: IO()
main = do x <- getWord
          print x