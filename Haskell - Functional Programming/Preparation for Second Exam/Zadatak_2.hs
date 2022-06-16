type Vector = [Float]

norma x = sqrt(sum(map (^2) x)) 

test2 _ _ 0 = 0
test2 (x:xs) y z | norma(map(\ (t,g) -> g - t)(zip (xs ++ [x]) y)) > 0.6 * norma(x:xs) = 1 + (test2 (xs ++ [x]) y (z-1))
                 | otherwise = test2 (xs ++ [x]) y (z-1)

test x = test2 x x (length x - 1)

-- Molimo, ne mijenjati kod ispod.
main :: IO()
main = do i <- getLine
          let x = read i :: Vector
          print $ test x
          