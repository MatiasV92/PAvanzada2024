{P } x := E {Q}  =  [P -> Q[x := E]]

--Ej 1

a) {wp} x := (x − y) ∗ (x + y) {x + y² = 0}

	={Sustitucion}

	(( (x − y) ∗ (x + y) ) + y² = 0

	={Aritmética}

	(x² + x*y - x*y - y²)  + y² = 0

	(x² - y²) + y² = 0

	x² = 0 = {wp}

b) {wp} q, r := q + 1, r − y {q ∗ y + r = x}

	={Sustitucion}

	(q + 1) ∗ y + (r - y) = x

	={Aritmetica}

	(q * y) + y + r - y = x 

	(q * y) + r = x  = {wp}

c) {wp} a := a ≡ b; b := a ≡ b; a := a ≡ b; { (a≡ B) ∧ (b≡ A) }

		{wp}
	E0
		a:= a ≡ b
	E1
		b:= a ≡ b
	E2
		a:= a ≡ b

	E2 -> wp (a := a ≡ b) . ((a≡ B) ∧ (b≡ A))
	E1 -> wp (b := a ≡ b) . (wp (a := a ≡ b) . ((a≡ B) ∧ (b≡ A)))

		wp (a := a ≡ b) . ( wp (b := a ≡ b) . (wp (a := a ≡ b) . ((a≡ B) ∧ (b≡ A))))

	--Reemplazar

	E0 = {b ≡ B ^ a ≡ A}

--Ej2

a) {A = q ∗ B + r} q := E; r := r − B {A = q ∗ B + r}

		{A = q ∗ B + r}
	E0
		q := E
	E1
		r := r − B


	E1 -> wp (r := r − B).{A = q ∗ B + r}
	E0 -> wp (q := E).(wp (r := r − B).{A = q ∗ B + r})

Resuelvo

	E1 - (A = q * B + r - B)
	E2 - (A = E * B + r - B)
		 (A = (E - 1) * B + r)
		 	[q = E-1]
		 (A = q * B + r)

     {P} -> wp.E.Q

(A = q ∗ B + r) ≡ (A = E * B + r - B)
	
={(q = E-1) ≡ (q + 1 = E)}

(A = q ∗ B + r) ≡ (A = q ∗ B + r)

--Ej3

{P} = {x = A ∧ y = B}
{S} = x := x - y; y := x + y; x := y - x;
{Q} = {x = B ∧ y = A}

P => wp.{S}.{Q}

E0 -> wp (x := y - x) . {x = B ∧ y = A}
E1 -> wp (y := x + y) .(wp (x := y - x).{x = B ∧ y = A})
E2 -> wp (x := x - y) .(wp (y := x + y ) .(wp ( x := y - x).{x = B ∧ y = A})))

Resuelvo

{Q} = {x = B ∧ y = A}

	E0 - ( y - x = B ∧ y = A)
	E1 - ( (x + y) - x = B ^ (x + y) = A)
	E2 - ( ((x-y) + y) - (x-y) = B ^ (x - y) + y = A)
	   - ( x - y + y - x + y ) = B ^ (x - y) + y = A
	{Arirtmetica}
		y = B ^ x = A

--Ej4

a).

{True} 							|
	if 							|	[P ⇒ (B0 ∨ B1 ∨ . . . ∨ Bn )]	
		x >= y -> skip			|	∧ {P ∧ B0 } S0 {Q}
		x <= y -> x,y := y,x 	|	∧ {P ∧ B1 } S1 {Q}
	fi 							|
{x ≥ y} 						|


True => (B0 =( x >= y ) ∨ B1 =( x <= y))
∧ {True ∧ B0 } S0 {Q}

Paso Disjuntivo

	B0 =( x >= y ) ∨ B1 =( x <= y)
={Terceo excluido}
	True

∧

(True ∧ B0 =( x >= y ) => wp skip. {x ≥ y})   A)

∧

(True ∧ B0 =( x <= y ) => wp (x,y := y,x). {x ≥ y})  B)


A)
	x >= y => wp skip. {x ≥ y}
=
	x >= y => x >= y
=
	True

B)
	x <= y => wp (x,y := y,x). {x ≥ y}
=
	x <= y => y ≥ x
= {Aritmetica}
	x <= y => x <= y 
=
	True


Paso Conjuntivo

	(B0( x >= y ) ∨ B1( x <= y)) ∧ (x >= y => wp skip. {x ≥ y}) ∧ (x <= y => wp (x,y := y,x). {x ≥ y})
=
	True ^ True ^ True
=
	True

---------------------------------------------------------------
b).

{True}
	x, y := y * y, x * x;      	|S1
	
	if 
		x >= y -> x := x + 1 	| S2
	 	x <= y -> y := y - x 	| S2
	fi
{x ≥ 0 ∧ y ≥ 0}

Hacer:

wp.S1.(wp.S2.Q)

True => (B0 =( x >= y ) ∨ B1 =( x <= y))


wp.S2(if).Q

	{(( x >= y ) ∨ ( x <= y) ) ∧ ((x >= y) -> wp.S00(x := x + 1).Q{x ≥ 0 ∧ y ≥ 0}) ∧ ((x >= y) -> wp.S01(y := y - x).Q{x ≥ 0 ∧ y ≥ 0})}

1.

( x >= y ) ∨ ( x <= y)

=
	True

2.

((x >= y) -> wp.S00(x := x + 1).Q{x ≥ 0 ∧ y ≥ 0})

={Sustitucion}
	
	(x >= y) -> x+1 >= 0 ^ y >=0

=

	x >= -1 ^  y >= 0

3.S01.

(x >= y) -> wp.S01(y := y - x).Q{x ≥ 0 ∧ y ≥ 0}

={Sustitucion}

	(x >= y) -> x >= 0 ^ y - x >=0
=

	x >= 0 ^ y >= x


Paso Conjuntivo

{(( x >= y ) ∨ ( x <= y) ) ∧ ((x >= y) -> wp.S00(x := x + 1).Q{x ≥ 0 ∧ y ≥ 0}) ∧ ((x >= y) -> wp.S01(y := y - x).Q{x ≥ 0 ∧ y ≥ 0})}

={Tercero Excluido}

	True ^ (x >= 0 ^ y >= x) ^ (x >= -1 ^  y >= 0)

={Absorsion}

	(x >= 0 ^ y >= x) ^ (x >= -1 ^  y >= 0)

S1-

	True -> wp.S1.(wp.S2.Q)
=
	True -> wp .(x, y := y * y, x * x).((x >= 0 ^ y >= x) ^ (x >= -1 ^  y >= 0))
=
	(y² >= 0 ^ x² >= y²) ^ (y² >= -1 ^ x² >= 0)
= {y² siempre mayor a 1}
	True



	True -> True
=
	True
------------------------------------------
c).

{True}

	if 	not a or b -> a := not a
		a or not b -> b := not b

{a ∨ b}

Derivación

1. [P -> (B0 ∨ B1 ... ∨ Bn)]

	[P -> (B0 ∨ B1)]

∧

2. {P ∧ Bi} Si {Q} = [P ∧ Bi -> wp.Si.Q]

	[P ∧ B0 -> wp.S0.Q]	

	∧

	[P ∧ B1 -> wp.S1.Q]	

1.

	[True -> ( (¬ a ∨ b)) ∨ (a ∨ ¬ b) )]
={Eliminacion de parentesis}
	¬ a ∨ b ∨ a ∨ ¬ b 
={Conmutatividad}
	¬ a ∨ a ∨ b ∨ ¬ b
={Tercero Excluido}
	True ∨ True
=
	True -> True

2.
a)
	True ∧ ( ¬ a ∨ b) -> wp.(a := ¬ a).(a ∨ b)
={def. wp}
	wp.(a := ¬ a).(a ∨ b)
={Sustitucion}
	¬a ∨ b
=
	(¬a ∨ b) -> (¬a ∨ b)
=
	True

b)
	True ∧ (a ∨ ¬ b) -> wp.(b := ¬ b).(a ∨ b)
={def. wp}
	wp.(b := ¬ b).(a ∨ b)
={Sustitucion}
	(a ∨ ¬b)
=
	(a ∨ ¬b) -> (a ∨ ¬b)
=
	True

3. Paso Conjuntivo

	(True -> True) ∧ (¬a ∨ b) ∧ (a ∨ ¬b)
={Absorcion}
	(¬a ∨ b) ∧ (a ∨ ¬b)
={por 2.a) y 2.b)}
	True ∧ True
=
	True


--------------------------------------------------------
d).

{N ≥ 0}
	x := 0
	do x <> N -> x := x + 1
	od
{ x = N }

{--

[P ∧ ¬B0 ∧ ¬B1 ∧ . . . ∧ ¬Bn ⇒ Q]
∧ {P ∧ B0 } S0 {P }
∧ {P ∧ B1 } S1 {P }
..
.
∧ {P ∧ Bn } Sn {P }
∧ el ciclo termina	

--}

Inicializacion:

Invrriante : { x <= N }

		P	  S		I
1. {N >= 0} x:=0 {x <= N}

	N >= 0 ->p. x:=0 (x <= N)

=

	0<=N

2.I ^ ¬B -> P

	x <= N  ^ x = N -> x = N
=
	x = N -> x = N
=
	True


3.{x <= N ^ x <> N} x := x + 1 {x <= N}

->

	{x <= N ^ x <> N} -> wp.(x := x + 1). (x <= N)
=
	x+1 <= N
=
	x <= N-1
={Aritmetica}
	x < N
Variante: {se propone un valor que se hace tender a 0}
		(t = x - N)

^^^^^^^^^^^^^^^^^^^^^^^^
Correccion Parcial
----------------------
Correccion Total


4. I ^ B0 -> v >=0

	x <= N ^ x = N -> N - x >= 0
=
	x <= N ^ x = N -> N >= x
=
	True

Variante: {se propone un valor que se hace tender a 0}
		
		(t = N - x)


5.{I ^B0 ^ t = T}

	x <= N ^ x <> N ^ N-x = T -> wp.(x:= x+1). N-x <T
=
	x <= N ^ x <> N ^ N-x = T -> N - (x-1) < T 
=
	x <= N ^ x <> N ^ N-x = T -> N - x + 1 < T
={Leibnitz : T = X-x}
	x <= N ^ x <> N ^ N-x = T -> N - x < T
=
	x <= N ^ x <> 	N ^ N-x = T -> T-1 < T
=
	True


1,2,3 ->Correcion Parcial (Invariante)
4,5 -> Correccion Total (Inv + Vaiante)

--Ej5

{--

[P ∧ ¬B0 ∧ ¬B1 ∧ . . . ∧ ¬Bn ⇒ Q]
∧ {P ∧ B0 } S0 {P }
∧ {P ∧ B1 } S1 {P }
..
.
∧ {P ∧ Bn } Sn {P }
∧ el ciclo termina	

--}

con N : Nat
var n : Nat; r : Bool
var A: array array:[0..N) of Nat

{N > 0}
	n,r := 0, True
	
	{r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N }
	
	do n <> N
		n,r := n + 1, r and A.n = A.(N - n -1)
	od

{r =< ∀i : 0 ≤ i < N : A.i = A.(N − i − 1) >}



Invaiante {I} = {r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N }

1. Inicializacion

{P}S{I}

P -> wp.S.I

{N > 0} n,r := 0, True {r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N }


	N > 0 -> wp. (n,r := 0, True). {r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N }

={Def wp}

	N > 0 -> {r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N } (n,r := 0, True)

={Sustitucion}

	N > 0 -> {r =< ∀i : 0 ≤ i < 0 : A.i = A.(N − i − 1) > ∧ 0 ≤ 0 ≤ N }

={Simplicacion}

	N > 0 -> {r =< ∀i : i = 0 : A.i = A.(N - i − 1) > ∧ 0 ≤ N }

={Rango Unitario, Aritmetica (A.(N-i-1): i=0 ≡ A.(N-1))}

	N > 0 -> True ∧ 0 ≤ N 

={Neutro de la conjuncion, Hipotesis :(N > 0)}

	True

2. PostCondicon : [I ∧ ¬B0 ∧ · · · ∧ ¬Bn -> Q]

	( {r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N } ∧ ¬(n <> N) ) -> {r =< ∀i : 0 ≤ i < N : A.i = A.(N − i − 1) >}

={Logica}

	r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N  ∧ n = N -> {r =< ∀i : 0 ≤ i < N : A.i = A.(N − i − 1) >}

={Por Hipotesis N >= 0}

	r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ N ≤ N  -> {r =< ∀i : 0 ≤ i < N : A.i = A.(N − i − 1) >}

	r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ True -> {r =< ∀i : 0 ≤ i < N : A.i = A.(N − i − 1) >}

={Neutro Conjuncion}

	r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > -> r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) >

=
	True

3. Invariante : [{Bi ∧ I} Si {I}]

		B0									I												S0 												I 	
	{(n <> N) ∧ (r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N )}  n,r := n + 1, r and A.n = A.(N - n -1)  {(r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N )}

={wp}
	
	{(n <> N) ∧ (r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N )} => wp.n,r := n + 1, r and A.n = A.(N - n -1) . {(r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N )}

={def wp}

	{(r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N )} (n,r := n + 1, r and A.n = A.(N - n -1))

={Sustitucion}

	{( r ∧ A.n = A.(N - n -1) =< ∀i : 0 ≤ i < (n+1) : A.i = A.(N − i − 1) > ∧ 0 ≤ (n+1) ≤ N )}

={Aritmetica}
	={0 ≤ i < n+1  ==  0 ≤ i <= n}
	
	{( r ∧ A.n = A.(N - n -1) =< ∀i : 0 ≤ i <= n : A.i = A.(N − i − 1) > ∧ 0 ≤ (n+1) ≤ N )}

={Aritmetica}

	{( r ∧ A.n = A.(N - n -1) =< ∀i : (0 ≤ i < n) ∨ (n = 1) : A.i = A.(N − i − 1) > ∧ 0 ≤ (n+1) ≤ N )}

={Particion de rarngo}

	{( r ∧ A.n = A.(N - n -1) =< ∀i : (0 ≤ i < n) : A.i = A.(N − i − 1) > ∧ < ∀i : n = 1 : A.i = A.(N − i − 1) > ∧ 0 ≤ (n+1) ≤ N )}

={Def r}

	{( r ∧ A.n = A.(N - n -1) = r ∧ < ∀i : n = 1 : A.i = A.(N − i − 1) > ∧ 0 ≤ (n+1) ≤ N )}

={Rango Unitario}

	{( r ∧ A.n = A.(N - n -1) = r ∧ A.n = A.(N − n − 1) ∧ 0 ≤ (n+1) ≤ N )}

={Aritmetica}
	
	{( r ∧ A.n = A.(N - n -1) = r ∧ A.n = A.(N − n − 1) ∧ 0 ≤ (n+1) ≤ N )}

	[[ 	0 ≤ (n+1) ≤ N 
		0 ≤ n ≤ N -1
		0 ≤ n ≤ N ∧	n /= N 
	]]

={Por Hipotesis} -- [0 ≤ n ≤ N ∧ n /= N, así N es mayor que 0 => True]

	{( r ∧ A.n = A.(N - n -1) = r ∧ A.n = A.(N − n − 1) ∧ True }

={Neutro para la conjuncion}

	{( r ∧ A.n = A.(N - n -1) = r ∧ A.n = A.(N − n − 1)}

={Def =}

	True

-HASTA ACA SE POBÓ LA CORRECION PARCIAL

4. Propuesta de variante (t)

t = N - n (cota)

i.	[I ∧ (B0 ∨ B1 ∨ . . . ∨ Bn ) ⇒ t ≥ 0]
ii.[{I ∧ Bi ∧ t = T } Si {t < T } ∀ 0 ≤ i ≤ n]

i.	r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ 0 ≤ n ≤ N  ∧ (n <> N)  ⇒ t ≥ 0

={Por Hipotesis, Def t }
	
	r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > ∧ True => N - n ≥ 0

={Particion de Rango}

	r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) > => N - n ≥ 0

={Por Hipotesis [N >= 0]}

	N ≥ n

ii.	{I ∧ B0 ∧ t = T } S0 {t < T  ∀ 0 ≤ i ≤ n}

	(r =< ∀i : 0 ≤ i < n : A.i = A.(N − i − 1) >) ∧ (0 ≤ n ≤ N) ∧ (N-n = T)

















































