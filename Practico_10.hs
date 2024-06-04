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
E1 -> wp (y := x + y) .(wp (y := y - x).{x = B ∧ y = A})
E2 -> wp (x := x - y) .(wp (y := x + y ) .(wp ( x := y - x).{x = B ∧ y = A})))

Resuelvo

{Q} = {x = B ∧ y = A}

	E0 - ( y - x = B ∧ y = A)
	E1 - ( x - (x + y) = B ^ (x + y) = A)
	E2 - ( (x - y) - ( ( x - y) - y ) = B ^ (x - y) + y = A)
	   - (x - y - x + y + y) = B ^ (x - y) + y = A
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



































