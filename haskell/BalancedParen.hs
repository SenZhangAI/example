import           Data.Semigroup as Sem

data B = B !Int !Int
    deriving (Eq, Show)

instance Sem.Semigroup B where
  (B a b) <> (B c d)
    | b <= c = B (a + c - b) d
    | otherwise = B a (d + b - c)

instance Monoid B where
  mempty = B 0 0

parse :: Char -> B
parse '(' = B 0 1
parse ')' = B 1 0
parse _   = B 0 0


-- 查看括号是否匹配
balanced :: Foldable t => t Char -> Bool
balanced xs = foldMap parse xs == B 0 0


main :: IO ()
main = do
    putStrLn "Enter String and Check if parentheses balanced"
    a <- getLine
    if balanced a
       then putStrLn "True"
       else putStrLn "False"
