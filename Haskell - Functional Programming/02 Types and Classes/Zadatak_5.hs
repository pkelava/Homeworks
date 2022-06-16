isprime 2 = True
isprime m = length [i | i <- [2..n], m `mod` i == 0] == 0
            where n = floor $ sqrt $ fromIntegral m
main :: IO()
main = do print (isprime 270000000)
          print (isprime 13)