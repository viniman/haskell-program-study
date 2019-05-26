-- Lista 2 - Linguagem de Programação - Programação Funcional - Haskell

-- @ Questao 01 -----------------------------------------

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib 2 = 1
fib n = fib(n-1) + fib (n-2)

-- fibs :: Int -> [Int]
-- fibs x
-- 	| x == (-1) = []
--  	| otherwise = fib(x):fibs(x-1)

fibs :: Int -> [Int]
fibs n
	| n == 0 = [0]:xs
	| n == 1 = [1]:xs
	| n == 2 = [1]:xs
fibs n (x:xs) = n : fibs(n-1)
-- ---otherwise = x:(fibs (n-1) + fibs(n-2))


-- fibs :: Int -> [Int]
-- fibs length xs == x
-- fibs fib (n-1) + fib (n-2) : xs


-- @ Questao 02 -----------------------------------------

merge :: [a] -> [a] -> [a]
merge (x:xs) (y:ys)
	| x == [] || y == [] = []
	| x ++ y merge xs ys

intersp :: a -> [a] -> [a]

mixHalf :: [a] -> ([a], [a])


-- @ Questao 03 -----------------------------------------

-- @ Questao 04 -----------------------------------------



-- @ Questao 05 -----------------------------------------
dec2int :: [Int] -> Int


-- @ Questao 06 -----------------------------------------



-- @ Questao 07 -----------------------------------------



-- @ Questao 08 -----------------------------------------


-- @ Questao 09 -----------------------------------------




-- @ Questao 10 -----------------------------------------




-- @ Questao 11 -----------------------------------------
