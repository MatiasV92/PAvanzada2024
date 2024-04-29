--Ej 16

evenHigherTen :: [Int] -> [Int]
evenHigherTen [] = []
evenHigherTen (x:xs) = [x | x <- xs , even x , x > 10 ]
--evenHigherTen (x:xs) = [x | x <- xs , mod x 2 == 0 , x > 10 ]

--Ej 19

lstDivs :: Int -> [Int]
lstDivs n = [ x | x <- [1..n], mod n x == 0]

esPrimo :: Int -> Bool
esPrimo n |length (lstDivs n) == 2 = True
          |otherwise = False 

lstPrimos :: Int -> [Int]
lstPrimos n = [ x | x <- [0..n] , esPrimo x == True]

-- Ej 20

prodCart :: [a] -> [b] -> [(a,b)]
prodCart (x:xs) (y:ys) = [(x,y) | x <- xs , y <- ys]