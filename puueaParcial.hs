--Definir por compension la funcion 
--allOccurIn :: Eq =>a [a] -> [a] -> Bool
-- de forma tal que allOcurrIn xs ys se verifica si
--todos los elementos  de xs son elementos de ys. 
--EJ
--allOccurrIn [1,5,2,5] [5,1,2,4] --> True
--allOcurrIn [1,5,2,5] [5,2,4] --> False

allOccurIn :: Eq a => [a] -> [a] -> Bool
allOccurIn xs ys = and [x 'elem' y | x <- xs]




--Tratar de crear una lista de BOOLEANOS por cada comparación
--finalmente hacer una conjuncion de los elementos de la lista 






--Ej1: Definir la funcion.
--De forma tal que deletN n x xs es la lista obtenida lego de eliminar
--las primeras n ocurrencias de x en xs. Por ejemplo , 
--deletN 2 'a' "Salamanca" --> Slmanca  

deletN:: Eq a => Int -> a -> [a] -> [a]
deletN 0 y xs = xs
deletN n y [] = []
deletN n y (x:xs) |y /= x = x : deletN n y xs
                  |otherwise = deletN (n-1) y xs









