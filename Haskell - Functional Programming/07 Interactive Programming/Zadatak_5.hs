isSpace :: Char -> Bool
isSpace c = c `elem` [' ', '\n', '\t']

fja [] = ""                  
fja (x:xs) | isSpace x = fja xs
           | otherwise = x : fja xs

inputReverse :: IO String
inputReverse = do x <- getLine
                  let input1 = read x :: String
                  return(reverse(fja input1))
                  
                  
                  
main :: IO()
main = do x <- inputReverse
          print (x :: String)