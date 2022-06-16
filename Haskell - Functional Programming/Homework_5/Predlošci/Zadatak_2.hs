-- Ne mijenjati definiciju liste.
data List a = Elem a (List a) | Null
    deriving Show
-- Kraj definicije.

getList :: IO (List Int)
getList = 
             
-- Ne mijenjati funkciju main.
main :: IO()
main = do l <- getList
          print l