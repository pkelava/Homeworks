faktorijela 0 = 1
faktorijela a = fromIntegral a * faktorijela(a-1)

f :: Int -> Int -> Double
f n m = sum[faktorijela k / faktorijela d | d <- [1 .. m], k <- [1 .. n]]

-- Ne mijenjati kod funkcije main.
main :: IO()
main = do a <- getLine 
          b <- getLine
          print $ f (read a :: Int) (read b :: Int)
          
          