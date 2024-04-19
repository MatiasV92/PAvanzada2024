--Lista  d factoriales desde 0 a n
--Definicion clasica-recursiva de Factorial y patron

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

--Definicion de factorial usando guardas

factorial_1 :: Int -> [Int]
factorial_1 n = reverse (aux n)
                where aux 0 = [1]
                      aux n = factorial n : aux (n-1)

--Definicion recursiva con uso de Acumuladores

--factorial_2 :: Int -> [Int]
--factorial_2 n = reverse (aux (n+1) 0 [1])
--                where aux n m (x:xs) = if n == m then 

--Definicion por lista por comprension

factorial_3 :: Int -> [Int]
factorial_3 n = [factorial x | x <- [0..n]]

--Definicion con funcion de orden superior

factorial_4 :: Int -> [Int]
factorial_4 n = map factorial [0..n]

--Definicion haciendo uso de SCANL

factorial_5 :: Int -> [Int]
factorial_5 n = scanl (*) 1 [1..n] 