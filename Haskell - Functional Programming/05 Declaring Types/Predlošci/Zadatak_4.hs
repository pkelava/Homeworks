type VelikiCijeliBroj = Integer
type VektorInt = [Int]
type MatricaInt = [[Int]] -- ili [VektorInt]

data Matrix a = Mat [[a]]

v2s :: (Show a) => [a] -> String
v2s v = concat ["[" ++ show a ++ "]" | a <- v]

instance (Show a) => Show (Matrix a) where
    show (Mat []) = []
    show (Mat (xs:[])) = v2s xs
    show (Mat (xs:xss)) = v2s xs ++ "\n" ++ show (Mat xss)

test :: Matrix Int
test = Mat [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

-- data Maybe a = Just a | Nothing

safediv :: Float -> Float -> Maybe Float
safediv a b | b == 0 = Nothing
            | otherwise = Just (a / b)

main :: IO()
main = do print (safediv 6 0)
          print (safediv 6 3)
          print (6.0 / 0.0)
          print test