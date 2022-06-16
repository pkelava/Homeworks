nelement

main :: IO()
main = do print (nelement 5 [1, 2, 3, 4, 5, 6] :: [Int])
          print (nelement 5 [1, 2, 3]  :: [Int])
          print (nelement (-7) [1, 2, 3, 4, 5, 6] :: [Int])
          print (nelement 5 []  :: [Int])