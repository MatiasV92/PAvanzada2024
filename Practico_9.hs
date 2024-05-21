--PRACTICO 9

--Ej2

{--
Demostrar las siguientes propiedades
	• map (f . g) xs = (map f).(map g) xs
	• reversa (xs ++ ys) = reversa ys ++ reversa xs
	• reversa (reversa xs) = xs

	map:: (a->b) -> [a] -> [b]
	map _ [] = []
	map f (x:xs) = f.x : map f xs

	(.) :: (b->c) -> (a->b) -> a -> c
	(f.g) x = f (g.x)
--}

--A)

map (f . g) xs = (map f).(map g) xs

Caso Base

[] = xs

	map (f . g) [] = (map f).(map g [])
= {Def Map g}
	map f  []
= {Def Map f}
	[]

Caso Inductivo (x:xs)
Hipotesis map (f . g) xs = (map f).(map g) xs

Parto de

	map (f . g) (x:xs)

={Def. Map}

	(f.g) x : map (f.g) xs

= {Def Map}

	(f.g) x : map f (map g xs)

= {Def Composicion}

	(map f) . (map g) xs

= { HI }
	
	True

--B)

reversa ([] ++ ys) = reversa ys ++ reversa []

Parto de:

	reversa ([] ++ ys)

= {Def Concat}

	reversa ys

= {Def Reversa}

	reversa ys ++ []

= {Def Concat}

	reversa ys ++ reversa []

Caso Inductivo (x:xs)
HI reversa (xs ++ ys) = reversa ys ++ reversa xs

reversa ((x:xs) ++ ys) = reversa ys ++ reversa (x:xs)

={Def Conct}

	reversa (x : (xs ++ ys))

={Def Reverse}

	reversa (xs ++ ys) ++ [x]

={HI}

	reversa ys ++ reversa xs ++ [x]

--C)

reversa (reversa xs) = xs

Caso Base xs =[]

	reversa (reversa [])

={Def Reversa}

	reversa []

={Def Reversa}

	[]

=
	True
{--
	reverse :: [a] -> [a]
	reverse [] = []
	reverse (x:xs) = reverse xs ++ [x]

--}


HI reversa (reversa xs) = xs

Caso Inductivo reversa (reversa (x:xs)) = (x:xs)

reversa (reversa (x:xs))

= {Def Reverse}

	reversa((reversa xs) ++ [x])

= {Def Reverse [reverse(xs++[x]) = x : reverse xs]}

	reversa (x : reversa xs)


= {Def Reverse ,ys =reversa xs}

	reversa (ys) ++ [x]

={Def Reverse [reverse(xs++[x]) = x : reverse xs], ys = reversa xs}

	x : (reversa (reversa xs))	

={HI}

	x : xs


--Ej3

f: [a] -> Bool

iguales.xs = < paratodo x.i : 0 <= i < (#xs) : xs.0 == xs.i >


Caso Base xs = []

	< paratodo x.i : 0 <= i < (#[]) : [].0 == [].i >
= {Def Cardinal #}
	
	< paratodo x.i : 0 <= i < 0 : x.0 == x.i >

= {Rango Vacio}

	True


HI = < paratodo x.i : 0 <= i < (#xs) : xs.0 == xs.i >

Caso Inductivo  (x.xs) 

	< paratodo x.i : 0 <= i < #(x:xs) : (x:xs).0 == (x:xs).i >

={Lógica}

	< paratodo i : i = 0 or  1 <= i < #(x:xs) : (x:xs).0 == (x:xs).i >

={Particion de Rango}

	< paratodo i : 0 <= i < (#xs) : xs.0 == xs.i > and < paratodo x.i : 0 <= i < (#xs) : xs.0 == xs.i >

-- !!!!!!!!!!!! SE DEBE MODULALRIZAR ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡

g.n.xs = < paratodo x.i : 0 <= i < (#xs) : n == xs.i >

-Caso Base xs = []

	< paratodo i : 0 <= i < #[] : n == [].i >

= {Rango Vacio [ #[] = 0 ]}

	< paratodo i : : n == [].i >
 
= 

	True

-HI = < paratodo i : 0 <= i < (#xs) : n == xs.i >
-Caso Inductivo = < paratodo i : 0 <= i < #(x:xs) : n == (x:xs).i >

< paratodo i : 0 <= i < #(x:xs) : n == (x:xs).i >

={Def Cardinal #}

< paratodo i : 0 <= i < 1+(#xs) : n == (x:xs).i >

={Particion de Rango}

< paratodo i : i = 0 : n == (x:xs).i > and < paratodo i : 1 <= i < #(xs) : n == (x:xs).i >

={Rango Unitario}

n = (x:xs).0 and < paratodo i : 1 <= i < #(xs) : n == (x:xs).i >

={Definicion Index}

(n = x) and < paratodo i : 1 <= i < #(xs) : n == (x:xs).i >

={Cambio de Variable [ i = i+1]}

(n = x) and < paratodo i : 0 <= i < #(xs) : n == (x:xs).i >

= {HI}

n = x and g.n.xs
	

Luego 

f:: [a] -> Bool
f.[] = True
f. (x:xs) = g.x.xs


g:: a -> [a] -> Bool
g.n.[] = True
g.n.xs = (n = x) and g.n..xs


--Ej 4























