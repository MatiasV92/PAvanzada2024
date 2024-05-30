-- Practico 4 --

--1
-- Pasos a forma normal
-- 2 * cuadrado (hd [2,4,5,6,7,8])

--Definiciones

cuadrado :: Int -> Int
cuadrado x = x * x

hd:: [a] -> a
hd (x:xs) = x

-- Forma Normal:

-- 2 * cuadrado (hd [2,4,5,6,7,8])
-- 2 *((hd [2,4,5,6,7,8]) * (hd [2,4,5,6,7,8]))
-- 2 * (2 * (hd [2,4,5,6,7,8])) [Distributiva]
-- 2 * (2 * 2)
-- 2 * 4
-- 8

-- Forma Aplicativa:
-- 2 * (cuadrado (hd [2,4,5,6,7,8]))
-- 2 * (cuadrado (2))
-- 2 * ( 2 * 2 )
-- 2 * 4
-- 8

--3
f :: Int -> Int -> Int
f x 0 = x
f x n = cuadrado (f x (n-1))

-- Resolver Aplicativa y Normal para [f 2 3]

-- Aplicativa

-- f 2 3
-- cuadrado (f 2 2)
-- cuadrado (cuadrado (f 2 1))
-- cuadrado (cuadrado (cuadrado (f 2 0)))
-- cuadrado (cuadrado (cuadrado (2)))
-- cuadrado (cuadrado (2*2))
-- cuadrado (cuadrado (4)))
-- cuadrado (4 * 4))
-- cuadrado 16
-- 16 * 16
-- 256

-- Normal

-- f 2 3
-- cuadrado (f 2 2)
-- (f 2 2) * (f 2 2)
-- cuadrado (f 2 1) * (f 2 2)
-- ( cuadrado (f 2 0) * cuadrado (f 2 0) ) * (f 2 2)
-- ( cuadrado (f 2 0) * cuadrado (f 2 0) ) * cuadrado (f 2 1)
-- ( cuadrado (f 2 0) * cuadrado (f 2 0) ) * ( cuadrado (f 2 0) * cuadrado (f 2 0) )
-- ( (2 * 2) * (2 * 2) ) * ( ( cuadrado (f 2 0) * cuadrado (f 2 0) )
-- (4 * 4) * ( ( cuadrado (f 2 0) * cuadrado (f 2 0) )
-- 16 * ( (cuadrado (f 2 0) * cuadrado (f 2 0) )
-- 16 * ( (2 * 2) * (2 * 2))
-- 16 * (4 * 4)
-- 16 * 16
-- 256















