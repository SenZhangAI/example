import           Data.Semigroup as Sem

data B = B !Int !Int
    deriving (Eq, Show)

instance Sem.Semigroup B where
  (B a b) <> (B c d)
    | a > d = B (a + c - d) b -- 如果左括号累计值多与右括号，左括号共a+c,抵消右括号a+c-d
    | otherwise = B c (d + b - a)

instance Monoid B where
  mempty = B 0 0

parse :: Char -> B
parse '(' = B 1 0 -- 将第一个参数作为累计左括号
parse ')' = B 0 1 -- 将第二个参数作为累计右括号
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
