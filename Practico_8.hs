{--
--

--Ej 1

--f una funcion que determina si los elementos de xs son
--todos iguales

f1_0.xs = < paratodo x.i : 0 <= i < (#xs - 1) : x.i == x.(i+1) >
iguales.xs = < paratodo x.i : 0 <= i < (#xs - 1) : < paratodo x.j : (i+1) < j < #xs : x.i == x.j > >

--f es una funcion ue determina si los elementos de una lista
--xs son todos diferentes

diferentes.xs = < paratodo x_i : 0 <= i < (#xs - 1) : x_i /= x_(i+1) >

--f es una funcion que detemina si los elementos  de una lista
--xs estan ordenados

f3.xs = < paratodo x.i : 0 <= i <= (#xs) : x.i < x.(i+1) >

--P es un predicado que es True sii cuando aparece 1 es xs
--entonces debe aparecer 0 en xs

f.xs = < existe x.i : 0 <= i < (#xs) : x.i == 1 > ^ < existe x.i : 0 <= i < (#xs) : x.i == 0  > 

--p es el producto de todos los elementos primos de xs
-- esPrimo :: [a] -> [a]

f.xs = < productoria i : 0 <= i < (#xs) : esPrimo xs.i >

--Ej2

--n es el menor entero tal que xs.n = True

f:[Bool] -> Nat

f.xs = < Min i : 0 <= n < #xs ^ xs.i : i >

--n es el ultimo elemento de xs tal que xs.n = True

f:[Bool] -> Nat

f.xs = < Max i : 0 <= i < (#xs) ^ xs.i = True : i >

--f es una funcion que devuelve True si y solo si todos
--los elementos de xs son equivalentes

f.xs = < paraTodo x.i : 0 <= i < (#xs) : xs.i = True >

--Ej3

--f.xs determina si xs tiene la misma cantidad de pares que impares

f.xs = < contaroria x.i : 0 <= i < #xs : esPar.(xs.i) > = < contaroria x.i : 0 <= i < #xs : esPar.(xs.i) >

--f.n determina si n es primo

f.n = < existe x.j : 1 < j < n : mod n j == 0 >

--f.xs.ys determina si ys es una subsecuencia de xs

f: [a] -> Bool

f.xs.ys = < existe as,bs : : xs = as ++ ys ++ bs >

--f.xs.ys determina si ys es una subsecuencia final de xs

f.xs.ys = < existe as : : xs = as ++ ys >

--Ej4

--1

sum.xs < sumatoria i : 0 <= i < (#xs) : xs.i >

f.xs = < min as, bs, cs : xs = as ++ bs ++ cs : sum.bs > 

--2

iguales.xs = < paratodo x.i : 0 <= i < (#xs - 1) : < paratodo x.j : (i+1) < j < #xs : x.i == x.j > >

maxigual.xs = < max as, bs, cs : xs = as ++ bs ++ cs ^ iguales.bs : length.bs >

maxigual.xs = < max as, bs, cs : xs = as ++ bs ++ cs ^ < paraTodo i : 0 <= i < (#bs-1) : i == (i+1) > : length.bs >

--3

diferentes.xs = < paratodo x_i : 0 <= i < (#xs - 1) : x_i /= x_(i+1) >

maxdistinto.xs = < max as, bs, cs : xs = as ++ bs ++ cs ^ diferentes.bs  : length.bs > 

maxdistinto.xs = < max as, bs, cs : xs = as ++ bs ++ cs ^ < paraTodo i : 0 <= i < (#bs-1) : i == (i+1) > : length.bs >

--
--}

--Ej5

-- Funciones Auxiliares

existe :: (a -> Bool) ->[a] -> Bool
existe f xs = or [ f x | x <- xs]

paraTodo :: (a -> Bool) ->[a] -> Bool
paraTodo f xs = and [ f x | x <- xs]

lstDivs :: Int -> [Int]
lstDivs n = [ x | x <- [1..n], mod n x == 0]

esPrimo :: Int -> Bool
esPrimo n |length (lstDivs n) == 2 = True
          |otherwise = False 

lstPrimos :: Int -> [Int]
lstPrimos n = [ x | x <- [0..n] , esPrimo x == True]

productoria :: (a -> Int) ->[a] -> Int
productoria f xs = product[ f x | x <- xs]

split2 :: [a] -> [([a],[a])]
split2 xs = [ (take i xs , drop i xs) | i <- [0..length xs] ] 

split3 :: [a] -> [([a],[a],[a])]
split3 xs = or [ (as,bs,cs) | (as,ys) <- split2 xs , (bs,cs) <- split2 ys]

sumaSeg :: [Int] -> Int
sumaSeg xs = sum [ sum (take i xs) | i <- [0..length xs] ]

---
--a)

allPrimesProd :: [Int] -> Int
allPrimesProd xs = productoria (*1) [ x | x <- (lstPrimos (length xs)) ]

--allPrimesProd xs = product [ xs!!i | i <-[0..length (xs-1)] , esPrimo (xs!!i)]

--b)

esSubSec :: Eq a => [a] -> [a] -> Bool
esSubSec xs ys = or [  x == y | x <- split2 xs , y <- split2 ys]









