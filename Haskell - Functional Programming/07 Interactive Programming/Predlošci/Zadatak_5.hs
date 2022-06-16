isSpace :: Char -> Bool
isSpace c = c `elem` [' ', '\n', '\t']

inputReverse :: IO String
                  
main :: IO()
main = do x <- inputReverse
          print (x :: String)