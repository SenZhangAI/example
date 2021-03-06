myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl f zero (x:xs) = myFoldl f (f zero x) xs
myFoldl _ zero []     = zero

myFoldr :: (b -> a -> a) -> a -> [b] -> a
myFoldr f zero (x:xs) = f x (myFoldr f zero xs)
myFoldr _ zero []     = zero

-- implement map by myFoldr
myMap :: (a -> b) -> [a] -> [b]
myMap f xs = myFoldr m' [] xs
  where m' x ys = f x : ys

-- implement filter by myFoldr
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f xs = myFoldr filter' [] xs
  where filter' x ys | f x = x : ys
                    | otherwise = ys
