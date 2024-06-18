--PRACTICO 9

--Ej1

f.xs:[a] -> [a]

(xs ++ ys) ++ zs = xs ++ (ys ++ zs)

Parto de 
	
	(xs ++ ys) ++ zs

={Def ++}

	< ∀ xs,ys,zs :: >



Caso Base xs = []

([] ++ ys) ++ zs = [] ++ (ys ++ zs)

={Def ++}

	ys ++ zs = ys ++ zs
=

	True

Caso Inductivo (x:xs)

HI: (xs ++ ys) ++ zs = xs ++ (ys ++ zs)

((x:xs) ++ ys) ++ zs = (x:xs) ++ (ys ++ zs)

={Def ++ [(x:xs)++ys = x:(xs ++ ys)]}

	(x:(xs++ys))++zs

={Def ++}

	x:((xs++ys)++zs)

={Asociatividad ++}

	x:(xs++(ys++zs))

={HI}

	True

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


= {Def Reverse ,ys = reversa xs}

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

	< paratodo i : i = 0 : xs.0 == xs.i > and < paratodo x.i : 0 <= i < (#xs) : xs.0 == xs.i >

-- !!!!!!!!!!!! SE DEBE MODULALRIZAR ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡

g.n.xs = < paratodo x.i : 0 <= i < (#xs) : n == xs.i >

-Caso Base xs = []

	< paratodo i : 0 <= i < #[] : n == [].i >

= {Rango Vacio #[] = 0 ]}

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
g.n.xs = (n = x) and g.n.xs


--Ej 4

f:: [a] ->Int
f.[] = 0
f.(x:xs) = productoria (x:xs)

f.xs = < productoria i : 0 <= i < (#xs) : xs.i >

Caso Base xs =[]

< productoria i : 0 <= i < [] : [].i >

={Rango Vacio #[] = 0 ]}

	< productoria i : 0 : [].i >

={Neutro Productoria}

	0

HI = < productoria i : 0 <= i < (#xs) : xs.i >
Caso Inductivo = (x.xs)

< productoria i : 0 <= i < #(x:xs) : (x:xs).i >

={Separacion de un Termino}

	(x = x.0) * < productoria i : 0 <= i < #(x:xs) : (x:xs).i+1 >

={Prop. Indexacion}

	(x = x.0) * < productoria i : 0 <= i < #xs : xs.i >

={HI}

	x = x.0 * f.xs	

--Ej5

	!!! HACER ¡¡¡

--Ej6

m :[Num] -> [Num]
m [] = 0
m (x:xs) = 

<Min i : 0 <= i < #xs : xs.i >

Caso Base xs = []

<Min i : 0 <= i < #[] : [].i >

={Rango Vacio}

<Min i : i = 0 : [].i >

=
	0

HI = <Min i : 0 <= i < #xs : xs.i >
Caso Base (x:xs)

< Min i : 0 <= i < #(x:xs) : (x:xs).i >

= {Separación de un Termino}

	x = x.0 Min	<Min i : 0 <= i < #(x:xs) : (x:xs).i+1 >

= {Def Indexacion}

	x = x.0 Min	<Min i : 0 <= i < #(xs) : (xs).i >

= {HI}

	x x = x.0 Min f.xs

--Ej7

Especificacion

fx.xs = {Existe i : 0 =< i < #xs : sum.xs - xs.i = xs.i}

Caso Base (xs = [])

fx.xs = {Existe i : 0 =< i < #[] : sum.[] - [].i = [].i}

= {Rango Vacio}

True

HI = {Existe i : 0 =< i < #xs : sum.xs - xs.i = xs.i}
Caso Inducivo (x:xs)

{--
	Separacion de un término  (Pagina 111)

		< (Operador) i : 0 =< i < #n+1 : T.i>
		T.0 [(Operdaror)] < (Operador) i : 0 =< i < #n+1 : T.(i+1)>
	
	Ej (+)
		<+i:0<=i<#(x:xs):T.i>
		T.0 + <+i:0<=i<#xs:T.(i+1)>

	Def Sum
		sum [] = 0
		sum (x:xs) = x + sum xs
--}

f.(x:xs) = {Existe i : 0 =< i < #(x:xs) : sum.(x:xs) - (x:xs).i = (x:xs).i}

= {Separación de termino, def Sum , Aritmtica}

	x + sum xs - x = x or {Existe i : 0 =< i < #(xs) : x + sum.(xs) - (x:xs).i+1 = (x:xs).i+1}

= {Aritmetica, Def Index}

	sum xs = x or {Existe i : 0 =< i < #(xs) : x+sum.(xs) - (xs).i = (xs).i}

=GENERALIZACION

	g.n.xs = {Existe i : 0 =< i < #(xs) : n + sum.(xs) - (xs).i = (xs).i}

	Caso Base xs = []

		g.n.[] = {Existe i : 0 =< i < #[] : n + sum.[] - [].i = [].i}

	={Rango Vacio}

		False

	HI = {Existe i : 0 =< i < #(xs) : n + sum.(xs) - (xs).i = (xs).i}
	Caso Inductivo = (x:xs)

		g.n.xs = {Existe i : 0 =< i < #(x:xs) : n + sum.(x:xs) - (x:xs).i = (x:xs).i}

		={Separacion Termino}

			n + x + sum xs - x = x or {Existe i : 0 =< i < #(xs) : n + x + sum.(xs) - (xs).i+1 = (x:xs).i+1}

		={Aritmetica,  Def Index}

			(n + sum xs = x) or {Existe i : 0 =< i < #(xs) : (n + x) + sum.(xs) - (xs).i = (xs).i}

		={Asociatividad -> n' = (n+x)}

			(n + sum xs = x) or {Existe i : 0 =< i < #(xs) : (n') + sum.(xs) - (xs).i = (xs).i}
		
		={ HI }
			
			n + sum xs = x or g.(n').xs

=FIN GENERALIZACION


Luego f.xs = g.0.xs

Para resolver f (que es un caso particular) , es necesario inicializar g.n.xs con n = 0

--Ej8

	f.x :: Nat -> Bool

	Nat = Min x

	Induccion por Casos

--Ej9

Derivar
	
	P.xs.ys = < ∃ as, bs :: ys = as ++ xs ++ bs >

-- Primero 
	
	P.xs.ys = < ∃ as :: xs = ys ++ as >

	Caso Base ys = []

	< ∃ as :: xs = ys ++ as >

=

	< ∃ as :: xs = [] ++ as >

={ Def Concat }

	< ∃ as :: xs = as >

={Intercambio de Rango}

	< ∃ as : xs = as : True >

={ Termino constante or Rango vacio}

	True

--Segundo 

< ∃ as :: (y:ys) = [] ++ as >

={Def ++}

	< ∃ as :: (y:ys) = as >

={Intercambio}

	< ∃ as : (y:ys) = as :: True >

= {Rango Unitario}

	True

--LUEGO

Cuando ys /= []

1. xs = []
or
2. xs /= [] -> (x:xs)

 P.[].(y.ys)

1.
 	< ∃ as :: [] = (y:ys) ++ as >
={Iguadad de listas}
 	< ∃ as :: [] = (y:ys) and [] = (as) >
={LogicaIntercambio entre R y T}
 	< ∃ as :: False and [] = (as) >
={Intercambio entre R y T}
	< ∃ as : False : True >

2.
	< ∃ as :: (x:xs) = (y:ys) ++ as >
={Def ++}
	< ∃ as :: (x:xs) =  y : (ys ++ as) >
={Igualdad de Listas}
	< ∃ as :: x = y and  xs =ys++ as >
={Dist and, or Existe}
	x = y and < ∃ as :: xs =ys++ as >
= {HI}
	x = y  and p.xs.ys


--Ej 10 (Tupling)

Sum xs = <Sumatoria i : 0 =< i < #xs : xs.i>

Prom xs = (sum xs, long xs) --HI--
Caso Base xs = []

	(sum [], long [])

={Def sum  long}

	(0,0)

Caso Inductivo (x:xs)

Prom (x:xs) = (sum (x:xs), long (x:xs))
	
	o

Prom (x:xs) = (sum (x:xs), #(x:xs))

={Def Sum, Long}

	(x + sum (xs), 1 + long (xs))

={Introduccion a y b}

	(x + a, 1 + b)

	[[ a = sum xs , b = long xs ]]
	[[(a, b) = (sum xs ,long xs) ]]

= HI

	(sum xs, long xs)

Hasell

promTupla :: [Int] -> (Int, Int)
promTupla [] = (0, 0)
promTupla (x:xs) = (x+a, 1+b)
					where (a,b) = promTupla xs






























