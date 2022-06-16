suma1 [] _ _  = []
suma1 (x:xs) i j  | i == j = i*j*x : suma1 xs i (j+1) 
                  | x `mod` 3  == 0 = 1 : suma1 xs i (j+1) 
                  | otherwise = 0 : suma1 xs i (j+1) 


suma [] _ _  = 0
suma (x:xs) i j  = (foldr(\x y->x+y ) 0 (suma1 x i j)) + suma xs (i+1) 0 

msum x = suma x 0  0

-- Molimo, ne mijenjati kod ispod.
main :: IO()
main = do i <- getLine
          let x = read i :: [[Int]]
          print $ msum x 