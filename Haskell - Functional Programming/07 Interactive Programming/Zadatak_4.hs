inputListSum :: IO Float
inputListSum = do x <- getLine
                  let input1 = read x :: [Float]
                  return(sum input1)
                  
main :: IO()
main = do i <- inputListSum
          print(i)