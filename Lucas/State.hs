data Stack a = Stack [a] deriving (Show, Eq)

empty :: Stack a
empty = Stack []

initStack :: [a] -> Stack a
initStack xs = Stack xs

-- push :: a ->  Stack a -> ((), Stack a)
-- push x (Stack xs) = ((), Stack (x:xs))

-- pop :: Stack a -> (a, Stack a)
-- pop (Stack (x:xs)) = (x, Stack xs)

push :: a -> State a ()
push x = State $ \(Stack xs) -> ((), Stack (x:xs))

pop :: State a a
pop = State $ \(Stack (x:xs)) -> (x, Stack xs)

newtype State a b = State {runState :: Stack a -> (b, Stack a)}

instance Functor (State a) where
    -- fmap :: (b -> c) -> State a b -> State a c
    fmap f (State h) = State $ \s -> (f $ fst $ h s, snd $ h s)

instance Applicative (State a) where
    pure x = State $ \s -> (x,s)
    -- <*> :: State a f -> State a b -> State a c 
    (State h) <*> (State g) = State $ \s -> ( (fst $ h s) $ fst $ g $ snd $ h s  , snd $ g $ snd $ h s)

instance Monad (State a) where
    -- return :: b -> State a b
    return x = State $ \s -> (x,s)
    -- >>= :: State a b -> (b -> State a c) -> State a c
    (State h) >>= f = State $ \s -> fun $ h s
        where  fun (a, ns) = (runState $ f a)  ns
            
-- foo :: State (Stack Int) ()
foo = do
    push 3
    a <- pop
    push 5
