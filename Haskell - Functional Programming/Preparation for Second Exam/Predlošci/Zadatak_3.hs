data Frac = Num Float Float | NaN
               deriving (Eq)

instance Show Frac where
    
(.+) :: Frac -> Frac -> Frac

(.-) :: Frac -> Frac -> Frac

(.*) :: Frac -> Frac -> Frac

(./) :: Frac -> Frac -> Frac

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