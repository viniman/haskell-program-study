-- 1.
fibs :: Int -> [Int]
fibs 1 = [1]
fibs 2 = [1,1]
fibs n = fibs (n-1) ++ [ last (fibs (n-1)) + last (fibs (n-2)) ]



--2.
--(a)
merge :: [a] -> [a] -> [a]
merge [] [] = []
merge x [] = x
merge [] x = x
merge (x:xs) (y:ys) = x : y : (merge xs ys)

--(b)
intersp :: a -> [a] -> [a]
intersp x [] = []
intersp x [y] = [y]
intersp x l = head l : x : intersp x (tail l)

--(c)
mixHalf :: [a] -> ([a],[a])
mixHalf xs = (xsLeft, xsRight)
             where xsLeft  = [x | (x,i) <- zip xs [0..], i `mod` 2 == 0]
                   xsRight = [x | (x,i) <- zip xs [0..], i `mod` 2 == 1]



--3.
listComprehension :: (a -> b) -> (a -> Bool) -> [a] -> [b]
listComprehension f p xs = [f x | x <- xs, p x]

ordemSuperior :: (a -> b) -> (a -> Bool) -> [a] -> [b]
ordemSuperior f p xs = map f (filter p xs)



--4.
map' :: (a -> b) -> [a] -> [b]
map' f l0 = foldr (\x l -> (f x) : l) [] l0

filter' :: (a -> Bool) -> [a] -> [a]
filter' p l0 = foldr (\x l -> if (p x) then x:l else l) [] l0



--5.
dec2int :: [Int] -> Int
dec2int xs = foldl (\x y -> 10*x + y) 0 xs



--6.
length' :: [a] -> Int
length' xs = sum (map (\_ -> 1) xs)



--7.
-- É retornada uma lista em que cada elemento corresponde a um elemento de xs cuja função addOne foi aplicada duas vezes.
-- A expressão map f (map g xs) representa uma composição (f . g) aplicada a todos os elementos x de xs.



--8.
-- Todos os elementos de xs são transformados em listas unitárias e, em seguida, é retornada uma nova lista que concatena todas as listas unitárias do fim para o
-- início, na mesma ordem de xs (essencialmente apenas retorna xs). A ordem é mantida pois, apesar de a concatenação ocorrer do fim para o início, cada novo
-- elemento é adicionado ao início da lista anterior.



--9.
--(a)
data Formula = Variable Char | T | F | And Formula Formula | Or Formula Formula | Not Formula | If Formula Formula | Iff Formula Formula

--(b)
data Association = Association [(Char,Bool)]

look :: Association -> Char -> Bool
look (Association []) c = False
look (Association ((c,b):csbs)) x = if c == x then b else look (Association csbs) x

add :: Association -> Char -> Bool -> Association
add (Association csbs) c b = Association $ (c,b):csbs

--(c)
eval :: Association -> Formula -> Bool
eval _ T = True
eval _ F = False
eval a (Variable c) = look a c
eval a (And f1 f2) = (eval a f1) && (eval a f2)
eval a (Or f1 f2) = (eval a f1) || (eval a f2)
eval a (Not f) = not $ eval a f
eval a (If f1 f2) = if eval a f1 then eval a f2 else True
eval a (Iff f1 f2) = (eval a f1) == (eval a f2)

--(d)
variables :: Formula -> [Char]
variables (Variable c) = [c]
variables T = []
variables F = []
variables (And f1 f2) = (variables f1) ++ foldr (\x acc -> if x `elem` (variables f1) then acc else x:acc) [] (variables f2)
variables (Or f1 f2) = (variables f1) ++ foldr (\x acc -> if x `elem` (variables f1) then acc else x:acc) [] (variables f2)
variables (Not f) = variables f
variables (If f1 f2) = (variables f1) ++ foldr (\x acc -> if x `elem` (variables f1) then acc else x:acc) [] (variables f2)
variables (Iff f1 f2) = (variables f1) ++ foldr (\x acc -> if x `elem` (variables f1) then acc else x:acc) [] (variables f2)

--(e)
bools :: Int -> [[Bool]]
bools 1 = [[True], [False]]
bools n = (map (True:) (bools (n-1))) ++ (map (False:) (bools (n-1)))

isTautology :: Formula -> Bool
isTautology F = False
isTautology T = True
isTautology f = foldr (\bs acc -> acc && eval (Association $ (variables f) `zip` bs) f) True (bools (length $ variables f))



--10.
--(b)
replace :: Eq a => a -> a -> [a] -> [a]
replace x y xs = foldr (\xi ys -> if xi == x then y:ys else xi:ys) [] xs



--11.
data Tree a = Tree a [Tree a] deriving Show

--(a)
height :: (Tree a) -> Int
height (Tree x []) = 0
height (Tree x children) = 1 + maximum (map height children)

--(b)
rootChildren :: (Tree a) -> Int
rootChildren (Tree x children) = length children

--(c)
instance Functor Tree where
  fmap f (Tree x children) = Tree (f x) (foldr (\c acc -> (fmap f c):acc) [] children)
