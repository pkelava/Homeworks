type Vector3 = (Float,Float,Float)
{-
get :: Vector3 -> Int -> Float
get (a, _, _) 0 = a
get (_, a, _) 1 = a
get (_, _, a) _ = a
-}
premutacije (a,b,c) = [(a,b,c),(c,a,b),(b,c,a),(b,a,c),(c,a,b),(a,c,b)]


sumv (a,b,c) (e,f,g) = a*e + b*f + c*g

fja _ [] = []
fja x (y:ys) = [sumv x y] ++ fja x ys

maxsumv x y = maximum(fja x (premutacije y))

-- Molimo, ne mijenjati kod ispod.
main :: IO()
main = do i <- getLine
          let x = read i :: Vector3
          i <- getLine
          let y = read i :: Vector3
          print $ maxsumv x y
          