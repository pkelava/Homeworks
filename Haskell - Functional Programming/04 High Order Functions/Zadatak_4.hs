sumsquares x = sum(map(\ y -> y^2) [1 .. x])

main :: IO()
main = do print (sumsquares 5)
          