data Complex = Num Float Float | NaN
               deriving (Eq)

instance Show Complex where
    show (Num a b) | a /= 0 && b == 0 = show a
                   | a == 0 && b /= 0 = (show b) ++ "i"
                   | a == 0 && b == 0 = "0"
                   | otherwise =  (show a) ++ " + " ++ ((show b) ++ "i")
    show NaN = "NaN"
    
(.+) :: Complex -> Complex -> Complex
(Num a b) .+ (Num c d) = Num (a+c) (b+d)

(.-) :: Complex -> Complex -> Complex
(Num a b) .- (Num c d) = Num (a-c) (b-d)

(.*) :: Complex -> Complex -> Complex
(Num a b) .* (Num c d) = Num (a*c-b*d) (a*d+b*c)

(./) :: Complex -> Complex -> Complex
(Num a b) ./ (Num 0 0) = NaN
(Num a b) ./ (Num c d) = Num ((a*c + b*d)/(c*c + d*d)) ((a*d - b*c)/(c*c + d*d))



-- Molimo, ne mijenjati kod ispod
main :: IO()
main = do i <- getLine
          let a = read i :: Float
          i <- getLine
          let b = read i :: Float
          i <- getLine
          let c = read i :: Float
          i <- getLine
          let d = read i :: Float
          print $ (Num a b) .+ (Num c d)
          print $ (Num a b) .- (Num c d)
          print $ (Num a b) .* (Num c d)
          print $ (Num a b) ./ (Num c d)