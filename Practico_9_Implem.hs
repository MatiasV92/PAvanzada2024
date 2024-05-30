{--conmuCCat :: Eq a => [a] -> [a] -> [a] -> [a]
conmuCCat [] ys zs = ys ++ zs
conmuCCat (x:xs) ys zs = x :(xs ++ (ys ++ zs))

conmCCatVerdad :: Eq a => [a] -> Bool
conmCCatVerdad xs ys zs |([]++ys)++zs == []++(ys++zs) = True
                        |where xs = []
                        |((x:xs)++ys)++zs == (x:xs)++(ys++zs) = True
						|otherwise = False--}


 -- !!!! SOLO SE IMPEMENTAN LAS  DERIVACIONES ¡¡¡¡