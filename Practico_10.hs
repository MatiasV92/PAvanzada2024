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

A = q ∗ B + r = A = E * B + r - B
	
={(q = E-1) ≡ (q + 1 = E)}

A = q ∗ B + r = A = q ∗ B + r























