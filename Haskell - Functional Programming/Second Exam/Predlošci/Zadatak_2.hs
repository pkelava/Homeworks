get :: Vector3 -> Int -> Float
get (a, _, _) 0 = a
get (_, a, _) 1 = a
get (_, _, a) _ = a

sumv

maxsumv

-- Molimo, ne mijenjati kod ispod.
main :: IO()
main = do i <- getLine
          let x = read i :: Vector3
          i <- getLine
          let y = read i :: Vector3
          print $ maxsumv x y
          