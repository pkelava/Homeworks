n :: Int
n = 100

cs 

main :: IO()
main = do i <- getLine
          let l = read i :: [Int]
          print $ cs l