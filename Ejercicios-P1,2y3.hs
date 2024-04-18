-- Practico 1 --

espar :: [Int] -> Bool
espar [] = error "Not a list"
espar xs = even (head(reverse xs)) 
--espar xs = even (sumlst xs)

multres :: [Int] -> Bool
multres [] = error "Not a list"
multres xs | mod (sumlst xs) 3 /= 0 = False
           | otherwise = True

mulseis :: [Int] -> Bool
mulseis [] = error "Not a list"
mulseis xs | mod (sumlst xs) 3 /= 0 && espar xs /= True = False
           | otherwise = True
-- Ej:A = [0..8]

dolst :: Int -> [Int]
dolst 0 = []
dolst x = mod x 10 : []

decrement :: Int -> Int
decrement 0 = 0
decrement x|x <= 9= x 
           |x > 9= decrement (div x 10)

sumlst :: [Int] -> Int
sumlst [] = 0
sumlst (x:xs) = x + sumlst(xs)

cortar :: Int -> Int -> [Char] -> [Char]
cortar _ _ [] = "Lista vacía"
cortar 0 0 xs = xs
cortar i j xs = take (j) (drop i (xs))

--(head.(drop 3)) "123456"

--drop 3 "123456" = "456"
--head "456" = "4"

--Arroja "4"

-- Practico 2 --

hd :: [a] -> a
hd [] = error "Not Lista"
hd xs = head xs

tl :: [a] -> [a]
tl [] = []
tl xs = tail xs

last' :: [a] -> a
last' [] = error "Not Lista"
last' xs = hd (reverse xs) 

init' :: [a] -> [a]
init' [] = []
init' xs = reverse (tl (reverse xs)) 

maxTres ::(Ord a) => a -> a -> a -> a
maxTres x y z| x > y && x > z = x
             | y > x && y > z = y
             | z > y && z > x = z


concat' :: [a] -> [a] -> [a]
concat' [] [] = error "Not List"
concat' [] ys = ys
concat' xs [] = xs
concat' xs ys = xs ++ ys

tomar :: Int -> [a] -> [a]
tomar _ [] = error "Not List"
tomar n (x:xs)| n <= 0 = xs
              |otherwise = x : take (n-1) xs

tirar :: Int -> [a] -> [a]
tirar _ [] = error "Not List"
tirar n (x:xs) | n <= 0 = xs
               |otherwise = tirar (n-1) xs

conCola :: a -> [a] -> [a]
conCola e [] = e:[] 
conCola e xs = reverse (e : (reverse xs))

abs' :: Int -> Int
abs' x | x >= 0 = x
      |otherwise = x*(-1)

edad :: (Int,Int,Int) -> (Int,Int,Int) -> Int
edad (d,m,a) (d',m',a') = a'- a 

xor :: Bool -> Bool -> Bool
xor True True = False
xor False False = False
xor True False = True
xor False True  = True

xor2 :: (Eq a) => a -> a -> Bool
xor2 x y | x == y = False
         |otherwise = True

primo :: Int -> Bool
primo x | x == 1 = False
        | x == 2 || x == 3 || x == 5 = True 
        | espar' x == True || multres' x == True || divCinco x == True = False
        | otherwise = True

espar' :: Int -> Bool
espar' x = even x 

multres' :: Int -> Bool
multres' x | mod x 3 /= 0 = False
           | otherwise = True

divCinco :: Int -> Bool
divCinco x | mod x 5 /= 0 = False
           | otherwise = True

nMenor :: Int -> [Int]
nMenor n | n < 0 = error "Not Natural"
         | n == 0 = 0:[]
         | otherwise = conCola (n) (nMenor(n-1))

--Falta Ej9

invert :: [a] -> [a]
invert [] = []
invert (x:xs) = conCola x (invert(xs))

--Falta Ej12

--sqrReal :: a -> a -> a ->

--Practico 3--

--1
merge :: (Ord a) => [a]->[a]->[a]
merge [] ys = ys
merge xs [] = xs
merge [] [] = []
merge (x:xs) (y:ys) | x < y = x : merge xs ys
                    | x > y = y : merge xs ys
                    | x == y  = x : merge xs ys
--merge xs ys = xs ++ ys

--ordenaLs :: [a] -> [a]
--ordenaLs 
--3
dosAlaN :: Int -> Int
dosAlaN 0 = 1
dosAlaN n | n < 0 = error "Not a Natural"
          | n > 0 = 2 * dosAlaN (n + (-1))
--4
natAbin :: Int -> [Int]
natAbin 0 = [0]
natAbin n | n < 0 = error "Not a Natural"
          | n > 0 = conCola (mod n 2) (natAbin (div n 2))

binLst :: Int -> [Int]
binLst 0 = [0]
binLst x = x : []

--5
esparBin :: [Int] -> Int
esparBin [] = 0
esparBin (x:xs) | x == 0 = esparBin (xs)
                | x == 1 = (2 ^ (length (x:xs))) + esparBin (xs)

--6
distanciaH :: (Eq a) => [a] -> [a] -> Int
distanciaH [] ys = 0
distanciaH xs [] = 0
distanciaH (x:xs) (y:ys) | x == y = 1 + distanciaH xs ys
                         |otherwise = 0

--7
perfCuad :: Int -> [Int]
perfCuad n = [ x ^ 2 | x <- [0..n]]

ispQuad :: Int -> [Int] -> Bool
ispQuad _ [] = False
ispQuad n (x:xs)| n == x = True
                |otherwise = ispQuad n xs

--8
repetido :: a -> Int -> [a]
repetido _ 0 = []
repetido z n = z : repetido z (n-1)

--9
nelem :: [a] -> Int -> a
nelem [] n = error "No List"
nelem (x:xs) n | n < 0 = error "Invalid Num Imput"
               |otherwise = hd (reverse(take n (x:xs)))
--               |otherwise = if (length (x:xs) >= n) 
--                  then nelem xs n
--                  else x

--10
--posicionesC :: [a] -> b -> [Int]
--posicionesC [] c = []
--posicionesC (x:xs) c | x /= c = posicionesC xs c
--                     |otherwise = [] 

--11
compact :: [Int] -> [Int]
compact [] = []
compact (x:y:xs) | x == y = compact (x:xs)
                 | otherwise =  x : y : compact xs

--- Fin de Practico 1, 2 y 3 ----

















