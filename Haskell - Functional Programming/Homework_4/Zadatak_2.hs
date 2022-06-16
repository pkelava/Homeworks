-- Ne mijenjati definiciju vektora.
data Vector a = Vec [a]
    deriving (Eq, Read, Show)
-- Kraj definicije

-- zbrajanje

(.+) :: (Num a) => Vector a -> Vector a -> Vector a
Vec xs .+ Vec ys = Vec[x+y | (x,y) <- (zip xs ys)]


-- oduzimanje
(.-) :: (Num a) => Vector a -> Vector a -> Vector a
Vec xs .- Vec ys = Vec[x-y | (x,y) <- (zip xs ys)]


-- skalarni produkt
(.*) :: (Num a) => Vector a -> Vector a -> a
Vec[] .* Vec[] = 0
Vec xs .* Vec[] = 0
Vec[] .* Vec ys = 0
Vec (x:xs) .* Vec (y:ys) = (x*y) + (Vec xs .* Vec ys)

-- mnozenje sa skalarom
(.*.) :: (Num a) => a -> Vector a -> Vector a
x .*. Vec xs = Vec[x*y | y <- xs]

-- norma
kvadriraj :: (Floating a) => [a] -> a
kvadriraj [] = 0
kvadriraj (x:xs) = x^2 + kvadriraj xs

norm :: (Floating a) => Vector a -> a
norm (Vec xs) = sqrt(kvadriraj xs)

-- gram-schmidt
podjeli :: (Floating a) => Vector a -> a -> [a]
podjeli (Vec []) _ = []
podjeli (Vec (x:xs)) y = [x / y] ++ podjeli (Vec xs) y 

bcrtano :: (Floating a) => Vector a -> Vector a -> Vector a 
bcrtano x y = x .- ((x .* y) .*. y)

ccrtano x y z = x .- ((x .* y) .*. y) .- ((x .* z) .*. z)

gs :: (Floating a) => [Vector a] -> [Vector a]
gs [] = []  
gs(x:xs) = [Vec(podjeli x (norm x))] ++ [Vec(podjeli(bcrtano(head xs)(Vec(podjeli x (norm x)))) (norm(bcrtano(head xs)(Vec(podjeli x (norm x))))))] ++ [Vec(podjeli(ccrtano (last xs) (Vec(podjeli x (norm x))) (Vec(podjeli(bcrtano(head xs)(Vec(podjeli x (norm x)))) (norm(bcrtano(head xs)(Vec(podjeli x (norm x))))))))(norm(ccrtano (last xs) (Vec(podjeli x (norm x))) (Vec(podjeli(bcrtano(head xs)(Vec(podjeli x (norm x)))) (norm(bcrtano(head xs)(Vec(podjeli x (norm x))))))))))]

-- Ne mijenjati funkciju main.
main :: IO()
main = do i <- getLine
          let vecA = read i :: Vector Float
          i <- getLine
          let vecB = read i :: Vector Float
          i <- getLine
          let vecC = read i :: Vector Float
          print (vecA .+ vecB)
          print (vecA .- vecC)
          print (vecA .* vecA)
          print (8 .*. vecA)
          print (norm vecA)
          print (gs [vecA, vecB, vecC])