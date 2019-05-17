-- HASKELL: GHCI
-- :reload

-- Funcao original
dobro :: Integer -> Integer
dobro x = 2 * x

-- Nova funcao
quadruplo :: Integer -> Integer
quadruplo x = dobro (dobro x)

-- Outra funcao

triplo :: Integer -> Integer
triplo x = dobro (dobro (dobro x))

-- (False, False) tupla
-- [False, False] lista

soma :: (Integer, Integer) -> Integer
soma (x, y) = x + y

conta_ate :: Integer -> [Integer]
conta_ate n = [0..n]

-- FUNCOES POLIMORFICAS (POLIMORFISMO) - FUNCOES GENERICAS

-- head (conta_ate 4)
-- tail (conta_ate 4)
-- null (conta_ate 4)

-- fst primeiro elemento de uma tupla-2
-- snd segundo elemento de uma tupla-2

-- Classe de Numeros: Num
-- Classe de Comparacao de valores iguais: Eq
-- Classe Comparacao que valor eh menor e maior: Ord

-- Extender da classe Ord
antes :: Ord a => (a, a) -> Bool
antes (x, y) = x < y

-- Extender da classe Eq
iguais :: Eq a => (a, a) -> Bool
iguais (x, y) = x == y


-- Funcoes e expressoes condicionais
menor :: (Int, Int) -> Int
menor (x, y) = if x < y then x else y

menor_de_tres :: (Int, Int, Int) -> Int
menor_de_tres (x, y, z) = if (x < y && x < z) then x else if (y < z) then y else z


-- Equacoes guardeadas (guarda |)
menor2 :: (Int, Int) -> Int
menor2 (x, y)
	| x < y = x
	| otherwise = y

menorTres :: (Int, Int, Int) -> Int
menorTres (x, y, z)
	| x < y && x < z = x
	| y < z          = y
	|otherwise       = z


-- Correspondencia de padrão 
not_logico :: Bool -> Bool
not_logico False = True
not_logico True = False

e_logico :: (Bool, Bool) -> Bool
e_logico (True, True) = True
e_logico (True, False) = False
e_logico (False, True) = False
e_logico (False, False) = False

-- caractere curinga: _ (Casa com qualquer tipo de padrão que apareça)
e_logico' :: (Bool, Bool) -> Bool
e_logico' (True, True) = True
e_logico' (_, _)       = False


-- Listas por Compreensão
-- Criam listas, fazer funcoes que criem funcoes que criam novas listas a partir de novos dados, outros conjuntos
-- Expressao X <- [1..5] é chamada gerador
-- Tal que: |
-- É dado por: <-
-- [x^2 | x <- [1..5]]
-- A ordem dos geradores altera o resultado
-- os proximos geradorse podem depender de outras variaveis de geradores anteriores
-- [(x, y) | x <- [1,2,3, y <- [4,5]]]
-- [(x,y) | x <- [1..3], y <- [x..3]]


--Funcao concatenar
concatenar :: [[a]] -> [a]
concatenar xss = [x | xs <- xss, x <- xs]

-- funcao even: se eh valido
-- [x | x <- [1..10], even x]
-- funcao isLower: se string eh ou nao minusculo
-- guardas: ,

--lowers :: String -> Int
--lowers xs = length [x | x <- xs, isLower x]


fat :: Int -> Int
fat n
	| n == 0 = 1 -- caso base
	| n > 0 = n * fat(n-1)
	| otherwise = error "n deve ser maior que 0"

fat' :: Int -> Int
fat' 0 = 1
fat' n = n * fat'(n-1)


-- Fibonacci com guardas
fib :: Int -> Int 
fib n
	| n == 1 = 1
	| n == 2 = 1
	| otherwise = fib (n-1) + fib (n-2)

-- Fibonacci com correspondência de padrão
fib' :: Int -> Int
fib' 1 = 1
fib' 2 = 1
fib' n = fib' (n-1) + fib' (n-2)


-- Maximo divisor comum de dois numeros (Algoritmo de Euclides)
mdc :: (Int, Int) -> Int
mdc (m, n)
	| n == 0 = m
	| otherwise = mdc(n, mod m n) -- otherwise = n > 0

-- Combinação de n itens em grupos de k
binom :: (Int, Int) -> Int -- comb
binom (n, k)
	| k == 0 = 1 -- k==0 || k==n
	| k == n = 1
	| n > k = binom(n-1, k-1) + binom(n-1, k)
	| otherwise = error "n deve ser maior que k"


-- Padroes em Listas
f :: [Char] -> Bool
f ['a',_,_] = True
f _ = False

-- operador chamado construtor: (:)
-- (x:xs)
-- x: eh um elemento
-- xs: eh uma lista
-- x passa a ser o primeiro elemento da lista
-- xa passa a ser a cauda da lista
-- [1:2:3:4] x = 1 xs = [2,3,4]
-- "haskell" x = 'h' xs = "askell"
-- [2.5] x = 2.5 xs = []

-- funcao f aceitando listas de qualquer tamanho
f' :: [Char] -> Bool
f' ('a':_) = True
f' _ = False

head :: [a] -> a
head (x:_) = x

tail :: [a] -> [a]
tail (_:xs) = xs

-- padrao (x:xs) nao faz correspondência com listas vazias
-- head []
-- em haskell, todas as funcoes tem prioridade contra outras operacoes
-- por isso, sempre usar parenteses

-- lista eh: [x, xs, []]
-- Eq: elemento que eu posso comparar se eh igual ou diferente
pertence :: Eq a => a -> [a] -> Bool
pertence _ [] = False -- lista vazia e ou _ (o _ deixa mais formal)
pertence e (x:xs)
	| x == e = True
	| otherwise = pertence e xs


-- Funcao n_esimo
n_esimo :: Int -> [a] -> a
n_esimo 1 (x:xs) = x
n_esimo n (x:xs) = n_esimo (n-1) xs


-- Versao mais interessante da Funcao n_esimo
n_esimo' :: Int -> [a] -> a
n_esimo' 1 (x:_) = x -- nao importa quem eh a calda
n_esimo' n (_:xs) = n_esimo (n-1) xs -- nao importa quem eh a cabeca

-- Funcao de inserir ordenado
-- Classe Ord: comparacao de inteiros de maior e menor que a classe Eq nao permite esse tipo de comparacao
-- a -> [a] -> [a]: lista generica
-- usar : para inserir na cabeca da lista
insere_ordenado :: Ord a => a -> [a] -> [a]
insere_ordenado e [] = [e]
insere_ordenado e (x:xs)
	| e < x = e : (x:xs)
	| otherwise = x : insere_ordenado e xs


-- Funcoes de ordem superior: simplificam bastante funcoes que usam recursao
-- Maioria de funcoes de recursao sobre listas podem ser reescritas usando funcoes de ordem superior
-- Funcao de mapeamento
-- funcao de ordem superior: quando possui ao menos um argumento que eh uma funcao ou um resultado que eh uma funcao
-- Mapeamento: aplicar uma funcao a cada um dos elementos da lista e cria uma nova lista modificada de mesmo comprimento
