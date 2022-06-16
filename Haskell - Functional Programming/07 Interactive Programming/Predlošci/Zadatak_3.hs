isSpace :: Char -> Bool
isSpace c = c `elem` [' ', '\n', '\t']
                  
getWord :: IO String

main :: IO()
main = do x <- getWord
          print x