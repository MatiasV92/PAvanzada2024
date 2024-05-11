--Ej1

data Nat = Zero | Succ Nat deriving Show

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
--seguir definiendo

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
--                 deriving Show

--Ej7

sizeBTree :: (BinTree a) -> Int
sizeBTree Nil = 0
sizeBTree (Node (hi) r (hd)) = 1 + (sizeBTree hi) + (sizeBTree hd)

--Ej8

heightBTree :: (BinTree a) -> Int
heightBTree Nil = 0
heightBTree (Node (hi) r (hd)) = 1 + max (heightBTree hi) (heightBTree hd)


--Ej9

instance Eq (BinTree a) where
    (==) Nil Nil = True
    (==) Nil (Node (hi) a (hd)) = False
    (==) (Node (hi) a (hd)) Nil = False
    (==) (Node (hia) a (hda)) (Node (hib) b (hdb)) = sizeBTree (Node (hia) a (hda)) == sizeBTree (Node (hib) b (hdb))

instance Ord (BinTree a) where
    (<=) Nil (Node (hi) a (hd)) = True
    (<=) (Node (hi) a (hd)) Nil = False
    (<=) (Node (hia) a (hda)) (Node (hib) b (hdb)) = sizeBTree (Node (hia) a (hda)) <= sizeBTree (Node (hib) b (hdb))

instance Show a => Show (BinTree a) where
    show Nil = "<>"
    show (Node (Nil) a (Nil)) = "<" ++ show a ++ ">"
    show (Node (hda) a (hdi)) = "<"++ show hda ++"|" ++ show a ++ "|"++ show hdi ++">"


--EXTRA AddedFunction QUICKSORT
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort left ++ [x] ++ qsort right
               where 
                left = [ a | a <- xs , a <= x ]
                right = [ b | b <- xs , b > x]









