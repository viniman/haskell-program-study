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

--	Alternativa 3:
fib3 n = map fib [1..n]

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
mixHalf :: [a] -> ([a], [a])
mixHalf [] = ([], [])
mixHalf [x] = ([x],[])
mixHalf (x:y:xys) = (x:xs, y:ys) where (xs, ys) = mixHalf xys

--	Exercicio 3:
listComprehension :: (a -> b) -> (a -> Bool) -> [a] -> [b]
listComprehension f g [] = []
listComprehension f g list = map f (filter g list)

--	Exercicio 4:
map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x xs -> f x : xs) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (\x xs -> if (f x) then x : xs else xs) []

--	Exercicio 5:
--dec2int [2,3,4,5] = 2345
dec2int :: [Int] -> Int
dec2int [] = 0
dec2int list = foldl (\x y -> x*10+y) 0 list

--	Exercício 6:
length' :: [Int] -> Int
length' list = sum (map (+1) (map (*0) list))

lengthTerrana :: [a] -> Int
lengthTerrana list = sum (map ( \x -> 1) list)

length2 l = sum (map (\x -> 1) l)     -- map (\x -> 1) l => Substitui os elementos da lista por 1 em cada posição e depois o sum soma todos e retorna o tamanho da lista

--	Exercício 7:
--	O efeito esperado em map addOne (map addOne xs) é de incrementar a lista em duas unidades em cada elemento da lista xs, um incremento no primeiro
--	no primeiro MAP e um segundo incremento no segundo map.
--	Sim, a propriedade seria que após a execução da operação g na lista xs será executada a operação f na lista gerada pela operação g, 
--	assim retornando uma lista resultante.

--	Exercício 8:
--	mystery xs = foldr (++) [] (map sing xs)              --	Seja (I)=(map sing xs) e (II)=foldr (++) [] (I) e sing x = [xs]
--	I - gera uma lista de listas no qual cada elemento de xs está em uma lista.
--	Exemplo:	map sing [1,2,3] = [[1],[2],[3]]
--	II - retorna o padrão de sublistas de volta para a lista xs original
--	Exemplo:	foldr(++)[][[1],[2],[3]] = [1,2,3]  
--	Operacoes realizadas: [3]'a'++[]'b' = [3]'c', [2]'d' ++ [3]'c' = [2,3]'e', [1]'f' ++ [2,3]'e' = [1,2,3]'K'
--	as marcações 'a','d','f' são os elementos da lista e 'b','c','e' são resultados parciais das operações realizadas e 'K' é o resultado final

--	Exercício 9:


--	Exercicio 10:
--	a) int2bit
--	data Bit = 1 | 0


--	b) replace :: Eq a => a -> a -> [a] -> [a]
replace :: Eq a => a -> a -> [a] -> [a]
replace2 :: Eq a => a -> a -> [a] -> [a]
replace3 :: Eq a => a -> a -> [a] -> [a]
replace4 :: Eq a => a -> a -> [a] -> [a]

replace x y xs = foldr (\xi ys -> if xi == x then y:ys else xi:ys) [] xs
replace2 a b = map $ \c -> if c == a then b else c               --	$ nesse caso é pra suprimir os parenteses, a lista é passada implicitamente 
                                                                 -- sem precisar escrever na declaração da função
replace3 a b = map(\c -> if c == a then b else c)                --	(Com parentesis)Passando a lista, o map pega da memória naturalmente
replace4 a b list = map(\c -> if c == a then b else c) list      --	Passando a lista o map pega da memória naturalmente

--	c) count :: Eq a => [a] -> [(Int, a)]
--count :: Eq a => [a] -> [(Int, a)]
--count xs = foldr (\x acc -> if (_,x) `elem` acc then ()) [] xs

--count2 :: Eq a => [a] -> [(Int, a)]
--count2 [] = []
--count2 x:xs = map (\ys -> if(length xs >= 0) then (length (filter(==x) xs)), x):ys )


--count3 :: Eq a => [a] -> [(Int,a)]
--count3 [] = []
--count3 (x:xs) = (1 + length (takeWhile (==x) xs), x) : count3 (dropWhile (==x) xs)

-- Exercício 11: