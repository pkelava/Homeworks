-- Pokrenite me!

f :: Float -> Float
f x = x^2

g :: Float -> Float
g x = x + 2

h :: Float -> Float
h x = f $ f $ f $ x

main :: IO()
main = do print ((f . g) 2)
          print ((g . f) 2)
          print (h 2)
          