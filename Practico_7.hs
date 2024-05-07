--Ej1

nand :: Bool -> Bool -> Bool
nand True True = False
nand _ _ = True

--Ej2

maj :: Bool -> Bool -> Bool -> Bool
maj p q r | nand p q == False = True
          | nand p r == False = True
          | nand q r == False = True
          | otherwise = False

--Ej3

existe :: (a -> Bool) ->[a] -> Bool
existe f xs = or [ f x | x <- xs]

paraTodo :: (a -> Bool) ->[a] -> Bool
paraTodo f xs = and [ f x | x <- xs]

-- xs_i EN HASKELL x!!i
-- < (cuantif) i : R : T> = cuantif [ T | R ]

--Ej4

sumatoria :: (a -> Int) -> [a] -> Int
sumatoria f xs = sum [ f x | x <- xs]

contatoria :: (a -> Int) -> [a] -> Int
contatoria f xs = length [ f x | x <- xs]

productoria :: (a -> Int) ->[a] -> Int
productoria f xs = product[ f x | x <- xs]




