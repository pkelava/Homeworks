lgen

lrec

main :: IO()
main = do print (lgen [1, 2, 3])
                (lrec [1, 2, 3])