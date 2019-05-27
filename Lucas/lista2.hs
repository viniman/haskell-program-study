--	Lista de Exercícios 2 - Haskell

--	Exercício 1: Fibonacci lista

--	indice e retorna o valor
fib:: Int -> Int
fib 1 = 1
fib 2 = 1
fib n = fib(n-1) + fib(n-2)

-- 	Numero de elementos que tera a lista de retorno correspondente até o indice digitado
fiblista :: Int -> [Int]
fiblista 1 = [1]
fiblista 2 = [1] ++ fiblista(1)
fiblista n = fiblista(n-1) ++ ((fib(n-1) + fib(n-2)):[])
--	Utiliza a funcao que retorna o indice calculado a incrementa em uma lista vazia e concatena com a lista
--	gerada pela recursão da função

--	Alternativa 2:
fib2 n = take n . map fst $ iterate (\(a,b) -> (b,a+b)) (0,1)

--	Exercício 2:
--	a) Implementação do merge
--	Método 1:
merge :: [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) = x : y : merge xs ys           -- Insere a cabeça da lista de x e de y na lista que sai do merge

--	Método 2: Mais eficiente
merge2 [] ys = ys
merge2 (x:xs) ys = x:merge2 ys xs

--	b) Implementação do intersp
intersp :: a -> [a] -> [a]
intersp x [] = []     --	Caso base
intersp x (y:ys) = if (length ys) /= 0 then y : x : intersp x ys else y:ys -- Se o tamanho da lista após a cabeça for diferente de zero, coloca o caractere especial senão segue a lista normal

--	c) Implementando o mixHalf
-- que dada uma lista, produz um par de listas onde ambas possuem metade dos elementos da lista original. 
-- Se a lista possuir tamanho ımpar, entao uma das listas tera um elemento a mais que a outra
--mixHalf :: [a] -> ([a], [a])
--mixHalf [] = [] --	Caso base: Lista vazia
--mixHalf (x:xs) = if ((length (x:xs))`mod` 2) == 0 then (fst(y:ys,z:zs)) mixHalf (xs) else (_, x:_) mixHalf (xs)

