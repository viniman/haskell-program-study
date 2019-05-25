-- Lista 2 - Linguagem de Programação - Programação Funcional - Haskell

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