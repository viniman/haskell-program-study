-- Lista 2 - Linguagem de Programação - Programação Funcional - Haskell

-- @ Questao 01 -----------------------------------------

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib (n-2)

fibs :: Int -> [Int]
fibs x
	| x == (-1) = []
 	| otherwise = fibs(x-1) ++ [fib(x)] -- :[] -- fib(x):fibs(x-1)


fibs_list :: Int -> [Int]
fibs_list 0 = [0]
fibs_list 1 = [0,1]
fibs_list n = fibs (n-1) ++ [ last (fibs (n-1)) + last (init (fibs (n-1))) ]

-- fib_list :: Int -> [Int]
-- fib_list x
--   	| x == 0 = [0]
--   	| x == 1 = [1]
--   	| otherwise = []


-- @ Questao 02 -----------------------------------------

--(a)
merge :: [a] -> [a] -> [a]
merge [] _ = []
merge _ [] = []
merge (x:xs) (y:ys) = x : y : merge xs ys

--(b)
intersp :: a -> [a] -> [a]
intersp _ [] = []
intersp elemento (x:xs)
	| (length xs) == 1 = xs
	| otherwise = x : elemento : intersp elemento xs

--(c)
mixHalf :: [a] -> ([a], [a])
mixHalf [] = ([], [])
mixHalf [x] = ([x], [])
mixHalf (x:y:xys) = (x:xs, y:ys) 
	where (xs, ys) = mixHalf xys


-- @ Questao 03 -----------------------------------------

-- [f x | x ← xs, p x]
listComprehension :: (a -> b) -> (a -> Bool) -> [a] -> [b]
listComprehension f g [] = []
listComprehension f g list = map f (filter g list)

-- @ Questao 04 -----------------------------------------
map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x xs -> f x : xs) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (\x xs -> if (f x) then x : xs else xs) []


-- @ Questao 05 -----------------------------------------
dec2int :: [Int] -> Int
dec2int [] = 0
dec2int list = foldl (\x y -> x*10+y) 0 list


-- @ Questao 06 -----------------------------------------

length' :: [Int] -> Int
length' list = sum (map (+1) (map (*0) list))

lengthTerrana :: [a] -> Int
lengthTerrana list = sum (map ( \x -> 1) list)


-- @ Questao 07 -----------------------------------------

{- 
Sim, é póssível. Pode-se criar uma função que receba como parametros duas funcoes
f e g quaisquer e faça o mapeamento através dos dois maps aninhados

-}

--doubleMap :: (b -> c) -> (a -> b) -> [a] -> [c]
-- doubleMap :: (Int -> Int) -> (Int -> Int) -> [Int] -> [Int]
-- doubleMap f g xs = map f (map g xs)

-- @ Questao 08 -----------------------------------------


-- @ Questao 09 -----------------------------------------

--(a)
data Logic = T | F

-- say :: Logic -> Bool
-- let say T = True
-- let say F = False

-- -- O tipo de dados pode receber paramentos tambem
-- -- Usando Logic e a classe Maybe como exemplo
-- -- Just e Nothing sao derivados de Maybe
-- data Maybe a = Nothing | Just a

--(b)


--(c)


--(d)


--(e)


-- @ Questao 10 -----------------------------------------
-- (a)
data Bit = Um | Zero

-- (b)
replace :: Eq a => a -> a -> [a] -> [a]
replace _ _ [] = []
replace x y xs = foldr (\xi ys -> if xi == x then y:ys else xi:ys) [] xs

-- replace x y (z:zs)
-- 	| z == x = y
--	| otherwise = replace x y zs
--replace x y list = map (\x -> )
--replace x y (z:zs) = [y | z <- y, z == x]


-- (c)


-- @ Questao 11 ----------------------------------------

