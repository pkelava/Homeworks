inputSum :: IO Int
inputSum = do x <- getLine
              y <- getLine
             -- let input1 = read x :: Int
             -- let input2 = read y :: Int
             -- print(input1 + input2)
              return((read x :: Int) + (read y :: Int))

main :: IO()
main = do i <- inputSum
          print(i)
      --do inputSum