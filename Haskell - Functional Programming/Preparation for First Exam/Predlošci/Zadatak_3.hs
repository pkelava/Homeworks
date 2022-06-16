import Data.List -- funkcija sort
import Data.Char -- funkcije ord i chr

thirdfreq s

-- Molimo, ne mijenjati kod ispod.
main :: IO()
main = do s <- getLine 
          print (thirdfreq s)