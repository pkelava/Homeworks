f1 :: IO()
f1 = do l <- getLine
        let x = read l :: Float
        print (4 * x)

f2 :: Int -> IO String
f2 n = do c <- getChar
          return $ take n $ repeat c

main :: IO()
main = do f1
          s <- f2 10
          print s