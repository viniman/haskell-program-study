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

-- fib_list :: Int -> [Int]
-- fib_list x
--  	| x == 0 = [0]
--  	| x == 1 = [1]
--  	| otherwise = last (fib_list(x-1))

-- fibs :: Int -> [Int]
-- fibs n
-- 	| n == 0 = [0]:xs
-- 	| n == 1 = [1]:xs
-- 	| n == 2 = [1]:xs
-- fibs n (x:xs) = n : fibs(n-1)
-- ---otherwise = x:(fibs (n-1) + fibs(n-2))


-- fibs :: Int -> [Int]
-- fibs length xs == x
-- fibs fib (n-1) + fib (n-2) : xs


-- @ Questao 02 -----------------------------------------

merge :: [a] -> [a] -> [a]
merge [] _ = []
merge _ [] = []
merge (x:xs) (y:ys) = x : y : merge xs ys

intersp :: a -> [a] -> [a]
intersp _ [] = []
intersp elemento (x:xs)
	| (length xs) == 1 = xs
	| otherwise = x : elemento : intersp elemento xs


mixHalf :: [a] -> ([a], [a])
mixHalf [] = []
mixHalf (x:xs) = ([x], head xs)


-- @ Questao 03 -----------------------------------------

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



-- @ Questao 08 -----------------------------------------


-- @ Questao 09 -----------------------------------------




-- @ Questao 10 -----------------------------------------


-- @ Questao 11 ----------------------------------------

