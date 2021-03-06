coins :: (Num a) => [a] 
coins = [2, 3, 7]

change :: (Ord a, Num a) => a -> [[a]]
change n = if n < minimum coins then [] else change' n where
	change' m  | m < minimum coins = [[]]
		   | otherwise = [ xs | x <- coins, x <= m, xs <- map (\ys -> x:ys) $ change' (m - x), sum xs == m ]     
