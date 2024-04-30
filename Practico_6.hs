--Ej1

data Nat = Zero | Succ Nat deriving Show

--instance Eq Nat where
--Zero == Zero = True
--Zero == Succ n = False
--Succ n == Succ m = n == m


--Ej2

natToInt :: Nat -> Int
natToInt Zero = 0
natToInt (Succ n) = 1 + natToInt n  

--Ej3

intToNat :: Int -> Nat
intToNat 0 = Zero
intToNat n = Succ (intToNat (n-1))

--Ej4

instance Num Nat where
    (+) x y = sumNat x y

sumNat :: Nat -> Nat -> Nat
sumNat Zero Zero = Zero
sumNat Zero (Succ m) = Succ m
sumNat (Succ n) Zero = Succ n
sumNat (Succ n) (Succ m) = sumNat n (Succ (Succ m))

--Ej5

instance Eq Nat where
    (==) Zero Zero = True
    (==) Zero n = False
    (==) n Zero = False
    (==) (Succ n) (Succ m) = n == m

instance Ord Nat where
    (<=) Zero n = True
    (<=) (Succ n) Zero = False
    (<=) (Succ n) (Succ m) = n <= m

--  n == m = natToInt (n) == natToInt (m)

--instance Show Nat where
--show n = show (natToInt n)

--Ej6

data BinTree a = Nil | Node (BinTree a) a (BinTree a)
                 deriving Show

--Ej7

sizeBTree :: (BinTree a) -> Int
sizeBTree Nil = 0
sizeBTree (Node (hi) r (hd)) = 1 + (sizeBTree hi) + (sizeBTree hd)

--Ej8

heightBTree :: (BinTree a) -> Int
heightBTree Nil = 0
heightBTree (Node (hi) r (hd)) = 1 + max (heightBTree hi) (heightBTree hd)






















