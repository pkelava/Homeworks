fja xs = zip xs (tail xs)

main :: IO()
main = do print (fja [1, 2, 3, 4, 5, 6] :: [(Int, Int)])
          print (fja "Teststr" :: [(Char, Char)])
          print (fja [] :: [(Int, Int)])