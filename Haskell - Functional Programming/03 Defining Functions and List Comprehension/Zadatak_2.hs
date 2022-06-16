dist (a,b,c)(x,y,z) = sqrt((a-x)^2+((b-y)^2)+(c-z)^2)


main :: IO()
main = do print (dist (1, 2, 3) (4, 5, 6))