check :: [Char] -> [Char] -> Bool
check s x = s `elem` [[x !! 0, x !! 1, x !! 2], 
                      [x !! 3, x !! 4, x !! 5],
                      [x !! 6, x !! 7, x !! 8],
                      [x !! 0, x !! 3, x !! 6],
                      [x !! 1, x !! 4, x !! 7],
                      [x !! 2, x !! 5, x !! 8],
                      [x !! 0, x !! 4, x !! 8],
                      [x !! 2, x !! 4, x !! 6]]

xo :: [Char] -> Char
xo f = if (check "XXX" f) then
         'X'
       else if (check "OOO" f) then
         'O'
       else
         'N'

set :: [Char] -> Int -> Char -> [Char]
set f i c = take (i - 1) f ++ [c] ++ drop i f

f2s :: [Char] -> String
f2s [] = ""
f2s f = concat [['[', c, ']'] | c <- take 3 f] ++ '\n' : f2s (drop 3 f)

loop :: Int -> [Char] -> IO ()
loop n f = do putStr $ replicate 32 '\n'
              putStr $ f2s f
              if (n == 9) then
                putStr $ "Nerijeseno!"
              else do
                let c = if n `mod` 2 == 0 then 'X' else 'O'
                putStr $ "Na potezu je igrac " ++ c : "\n"
                i <- getLine
                if (i `elem` [show k | k <- [1..9], f !! (k - 1) == ' ']) then do
                    let g = set f (read i :: Int) c
                    if xo g == 'N' then
                        loop (n + 1) g
                    else do
                        putStr $ replicate 32 '\n'
                        putStr $ f2s g
                        putStr $ "Pobjednik je " ++ [c]
                else 
                    loop n f

main :: IO()
main = do loop 0 (replicate 9 ' ')

