data Complex = Num Float Float | NaN
               deriving (Eq)

instance Show Complex where
    show (Num a b) | a /= 0 && b == 0 = show a
                   | a == 0 && b /= 0 = 
                   | a == 0 && b == 0 = 
                   | otherwise = 
    show NaN = "NaN"
    
(.+) :: Complex -> Complex -> Complex
(Num a b) .+ (Num c d) =

(.-) :: Complex -> Complex -> Complex

(.*) :: Complex -> Complex -> Complex

(./) :: Complex -> Complex -> Complex

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