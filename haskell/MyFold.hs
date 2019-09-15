myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl _ zero []     = zero
myFoldl f zero (x:xs) = myFoldl f (f zero x) xs

myFoldr :: (b -> a -> a) -> a -> [b] -> a
myFoldr _ zero []     = zero
myFoldr f zero (x:xs) = f x (myFoldr f zero xs)

-- implement map by myFoldr
myMap :: (a -> b) -> [a] -> [b]
myMap f xs = myFoldr m' [] xs
  where
    m' a b = f a : b

-- implement filter by myFoldr
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f xs = myFoldr filter' [] xs
  where
    filter' a b
      | f a = a : b
      | otherwise = b
