--Prioridad
--Listas por comprensión, funciones de alto orden

--Ej 1

lstUnosInfs :: [Int]
lstUnosInfs = [ x | x <-[1,1..]]

--Ej 2

lstInfDsdN :: Int -> [Int]
lstInfDsdN n = [ x | x <-[n, (n+1)..]]

--Ej3

lstFirstNNats :: Int -> [Int]
lstFirstNNats n = [ x | x <- [0..n]]

--Ej4

fiveFirsEnteros :: [Int]
fiveFirsEnteros = take  5 (lstInfDsdN 0)

--Utilizando Funciones de alto orden

--Ej5

apliFuncALst :: (a -> a) -> [a] -> [a]
apliFuncALst  f [] = []
apliFuncALst f xs = map f xs

--Ej6

-- PROBAR FILTER

--lstDivsAO :: a -> [a]
--lstDivsAO n = 

--Ej7 

--slctPrimoLst :: Eq a => (a -> a) -> [a] -> [a]
--slctPrimoLst f (x:xs) | f x == True = x : slctPrimoLst f xs
--                      | otherwise = slctPrimoLst f xs 

--Ej8

sumCuadLst :: [Int] -> Int
sumCuadLst xs = sum (map (^2) xs) 

--Ej9

lstSucc :: [Int] -> [Int]


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