horner

main :: IO()
main = do i <- getLine
          let x = read i :: Float
          i <- getLine
          let p = read i :: [Float]
          print $ horner x p
          