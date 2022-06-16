inputZip :: IO [(Char, Char)]
inputZip = do x <- getLine
              y <- getLine
              let input1 = read x :: String
              let input2 = read y :: String
              return(zip input1 input2)

main :: IO()
main = do i <- inputZip
          print(i)