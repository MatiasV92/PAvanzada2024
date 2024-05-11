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
lstSucc xs = map (+1) (xs)

--Ej10

sumLst :: [Int] -> Int
sumLst xs = sum xs

--Ej11

factFold :: [Int] -> Int
factFold (x:xs) = foldr (*) x xs

--Ej12

and' :: [Bool] -> Bool
and' (x:xs) = foldl (&&) x xs

--Ej13

--tam1 :: (Num a) => [a] -> Int

--tam1 xs = length (foldl () [] xs)
--tam1 xs = foldl (\acc x -> acc + x ) 0 xs
--tam1 = foldl (+) 0 

--Listas por Comprension

--Ej14

succPComp :: [Int] -> [Int]
succPComp xs = [x + 1| x <- xs]

--Ej15

cuadsPComp :: [Int] -> [Int]
cuadsPComp xs = [ x ^ 2 | x <- xs]

--Ej 16

evenHigherTen :: [Int] -> [Int]
evenHigherTen [] = []
evenHigherTen (x:xs) = [x | x <- xs , even x , x > 10 ]
--evenHigherTen (x:xs) = [x | x <- xs , mod x 2 == 0 , x > 10 ]

--Ej17

lstDivs :: Int -> [Int]
lstDivs n = [ x | x <- [1..n], mod n x == 0]

--Ej18

todosOcurrenEn :: Eq a => [a] -> [a] -> Bool
todosOcurrenEn xs ys = foldr (&&) True [ x == y | x <- xs , y <- ys]

--Ej 19

--lstDivs :: Int -> [Int]
--lstDivs n = [ x | x <- [1..n], mod n x == 0]

esPrimo :: Int -> Bool
esPrimo n |length (lstDivs n) == 2 = True
          |otherwise = False 

lstPrimos :: Int -> [Int]
lstPrimos n = [ x | x <- [0..n] , esPrimo x == True]

-- Ej 20

prodCart :: [a] -> [b] -> [(a,b)]
prodCart (x:xs) (y:ys) = [(x,y) | x <- xs , y <- ys]

--Ej21

occurEnLst :: Eq a => [a] -> a -> Int 
occurEnLst xs e = length [x | x <- xs , x == e]

--Ej 22

split2 :: [a] -> [([a],[a])]
split2 xs = [ (take i xs , drop i xs) | i <- [0..length xs] ] 

--split2 xs = [ x | x <- zip (init xs) (tail xs) ]

--Ej 23 

sumaSeg :: [Int] -> Int
sumaSeg xs = sum [ sum (take i xs) | i <- [0..length xs] ]

test :: [Int] -> [[Int]]
test xs = [(take i xs) | i <- [0..length xs] ]


--Ej 24

infLstPares :: [Int]
infLstPares = [x | x <- [0..], even x]














