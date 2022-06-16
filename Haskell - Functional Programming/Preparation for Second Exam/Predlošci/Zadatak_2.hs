-- Molimo, ne mijenjati kod ispod.
main :: IO()
main = do i <- getLine
          let x = read i :: Vector
          print $ test x
          