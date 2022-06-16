msum

-- Molimo, ne mijenjati kod ispod.
main :: IO()
main = do i <- getLine
          let x = read i :: [[Int]]
          print $ msum x 