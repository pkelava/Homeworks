pretvori2 [] _ = []
pretvori2 (x:xs) y | x `elem` y = "1" : pretvori2 xs y
                   | otherwise = pretvori2 xs y

pretvori x y = return (pretvori2 x y)

getStr = do i <- getLine
            let x = i :: String
            return x

rijec x =do i <- getStr
            if length i == x then return i else rijec x
             
getBroj :: Int -> Int -> String -> String -> IO ()
getBroj x y z l | x == 0 = print((read z :: Int))
                | (x `mod` 2 == y `mod` 2) && (y `mod` 2 == 1) = do t <- (rijec x)
                                                                    f <- (pretvori t l)
                                                                    i <- getLine
                                                                    let input = read i :: Int
                                                                    getBroj input (y+1) (z++(concat(f))) l
                |x `mod` 2 == y `mod` 2 = do t <- (rijec x)
                                             i <- getLine
                                             let input = read i :: Int
                                             getBroj input (y+1) z t
                | otherwise = do i <- getLine
                                 let input = read i :: Int
                                 getBroj input y z l
  
main :: IO()
main = do i <- getLine
          let input = read i :: Int
          (getBroj input 0 "" "")