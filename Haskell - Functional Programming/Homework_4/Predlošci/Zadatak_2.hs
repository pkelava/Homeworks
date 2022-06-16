-- Ne mijenjati definiciju vektora.
data Vector a = Vec [a]
    deriving (Eq, Read, Show)
-- Kraj definicije

-- zbrajanje
(.+) :: (Num a) => Vector a -> Vector a -> Vector a
Vec xs .+ Vec ys =

-- oduzimanje
(.-) :: (Num a) => Vector a -> Vector a -> Vector a

-- skalarni produkt
(.*) :: (Num a) => Vector a -> Vector a -> a
                         
-- mnozenje sa skalarom
(.*.) :: (Num a) => a -> Vector a -> Vector a

-- norma
norm :: (Floating a) => Vector a -> a

-- gram-schmidt
gs :: (Floating a) => [Vector a] -> [Vector a]

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