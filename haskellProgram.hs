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


-- Funcoes de ordem superior: quando possui ao menos um argumento que eh uma funcao ou um resultado que eh uma funcao
-- elas simplificam bastante funcoes que usam recursao
-- Maioria de funcoes de recursao sobre listas podem ser reescritas usando funcoes de ordem superior
duas_vezes :: (a -> a) -> a -> a -- entrada: funcao que recebe um valor e retorna outro valor
duas_vezes f x = f (f x) -- aplica a funcao duas vezes sobre o valor x (parenteses para garantir que ele faca a operacao de dentro primeiro depois aplique a f ao resultado)
-- primeiro argumento eh uma funcao que mapeia um valor a em outro valor do tipo a
-- segundo argumento eh uma variavel do tipo generico
-- saida tbm eh uma variavel de tipo generico
-- nao especifica/ limita tipo a em Num (numerico) ou String ou qualquer outra classe
-- eh um 'a' qualquer: ideia eh que essa funcao se aplique a elementos de qualquer tipo

-- a funcao "duas_vezes" pode ser aplicada a qualquer funcao de um argumento que a saida seja a mesma do argumento de entrada
dobro :: Num a => a -> a
dobro x = x * 2

metade :: Float -> Float
metade x = x / 2

-- Usar a funcao "duas_vezes" usando como entrada a funcao "dobro" e "metade" acima
-- dobro (dobro 3)
-- duas_vezes dobro 3: aplicacao duas vezes da funcao dobro
-- metadde (metade 8)
-- duas_vezes metade 8

-- Funcoes de ordem superior:
-- permitem definir padroes de computacao que podem ser reutilizados
-- facilita definicao de funcoes genericas

-- muitas dessas funcoes sao aplicadas em listas
-- funcoes genericas sobre listas aplicam alguma regra geral sobre os elementos da lista
-- Existem 3 funcoes basicas em haskell que usam: mapeamento, filtragem, reducao



-- Funcao de mapeamento
-- Mapeamento: aplicar uma funcao a cada um dos elementos da lista e cria uma nova lista modificada de mesmo comprimento


-- Dobrar uma lista de elementos
dobrar :: Num a => [a] -> [a] -- Num: tanto faz se eh inteiro ou real
dobrar [] = []
dobrar (x:xs) = (x*2) : dobro xs

-- Incrementar os elementos de uma lista
incrementar :: [Int] -> [Int]
incrementar [] = []
incrementar (x:xs) = (x+1) : incrementar xs -- incrementa a cabeca da lista e recursivament a cauda

-- funcao de mapeamento deve receber os seguintes parametros
-- 1) uma funcao de transformacao
-- 2) Uma lista de elementos a ser transformada
-- Utilizaremos a funcao map

-- map ja existe no preludio padrao da linguagem, mas mostramos abaixo como ela poderia ser implementada
-- usamos uma funcao geral, uma funcao generica de entrada
-- map se aplica sobre listas, porem a funcao usada no map eh usada em cada elemento
-- a funcao map aplica a funcao f a toda a lista de maneira recursiva
map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : map f xs


-- Versao das funcoes dobrar e incrementar, agora usando map
-- Agora o map que vai executar o caso base 

-- a funcao eh o operador * e o argumento dela eh 2
-- vai aplica em cada elemento da lista 1 -> que eh igual a (x:xs)
dobrar_map :: Num a => [a] -> [a]
dobrar_map 1 = map (*2) 1

-- pŕimeiro argumento: (+1)
-- segundo argumento: 1
incrementar_map :: [Int] -> [Int]
incrementar_map 1 = map (+1) 1


-- Exemplos aplicaveis diretamente no terminal
-- map (+7) [1,2,3]
-- map (even) [1,2,3,4]
-- map ("Sr." ++) ["joao", "Pedro", "Luiz"]

-- [Int] -> [Int]
-- [Int] -> [Bool]
-- operador ++ de concatenacao de strings
-- [String] -> [Sting]