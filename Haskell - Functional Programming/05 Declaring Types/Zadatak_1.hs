data Boolean = T | F

data Moves = Lt | Rt | Up | Dn

data Surface = Circle Float | Rectangle Float Float | Triangle Float Float Float

surf :: Surface -> Float
surf (Circle r) = r * r * 3.14
surf (Rectangle a b) = a * b
surf (Triangle a b c) = sqrt (s * (s - a) * (s - b) * (s - c))
                        where s = (a + b + c) * 0.5

main :: IO()
main = do print (surf (Circle 2))
          print (surf (Rectangle 5 4))
          print (surf (Triangle 3 4 5))