-- /*********************************************************************************************************
--  *																										*
--  *												RESUMO DE HASKELL										*
--  *																										*
--  *********************************************************************************************************
--
--	É uma linguagem completamente funcional
--	Operações:
--	2*3+4 => Segue a ordem das operações matemáticas. Operadores:(+,-,*,^,sqrt(),**[é igual ao pow em Java])
--	35 `div` 4 -- Divisão inteira
--	Comparativos: "==" igualdade, "/=" diferente, "&&" 'e' lógico, "||" 'ou' lógico, "not" 'não'(Inverte o operador)
--	Tipos de dados: Integer(é diferente de Int), Float, Double, Char, Boolean

--	Tipo 'Num' é referente a um número, independente se é Float, Int, Double. Ideal para funções que trabalham com números
--	independente da precisão
--	Tipo 'Eq' em funções, remete a uma comparação seja numerica, caracteres ou strings, é uma comparação de tipo genérico
--	Tipo 'Ord' em funções, remete a comparação de ordem, independente do tipo do dado

--	You can also define functions that have no letters! This lets
--	É possível definir o próprio operador de função
--	integer division
--	(//) a b = a `div` b
--	35 // 4 -- 8


--	EXPRESSÕES LAMBDA: Comumente chamadas de funções anônimas. \x = "lambda x"
--	Sem usar expressões anônimas !
--	listaSomaUm lst = map somaUm' lst where somaUm' x = x + 1
--	Usando expressões anônimas !
--	listaSomaUm' lst = map (\x -> x + 1) lst

--	OPERADORES IMPORTANTES:

--	1) read:
--		Converte uma string para um tipo especificado.
--	Read a => String -> a
--	read: String -> Float     
--	Exemplo:
--		read "12"::Int => 12
--		read "12"::Double => 12.0
--		read "True"::Bool => True
--		

--	2) show:
--		Converte o argumento para string.
--	show a => a -> String
--	show: Float -> String
--	Exemplo:
--		show 12 => "12"
--		show True => "True"
--		show [1,2,3] => "[1,2,3]"
--		show (zip [1,2,3] [5,4,3]) => "[(1,5),(2,4),(3,3)]"

--	3) map:
--		Executa a operação passada no parâmetro na lista
--	(a -> b) -> [a] -> [b]
--	map (operacao) lista:	  
--	Exemplo:
--		map (+2) [1..5] => [3,4,5,6,7]
--		map (show) [1,3,5,6,7] => ["1","3","5","6","7"]			   --	Transforma uma lista numerica em uma lista de strings
--		map abs [-1,-3,4,-12] => [1,2,3,4,12]					   --	Transforma a lista em elementos positivos
--		map reverse ["abc","cda","1234"] => ["cba","adc","4321"]   --	Inverte as strings da lista

--	4) filter:
--		Filtra uma lista a partir de condição estabelecida.
--		(a -> Bool) -> [a] -> [a]	
--	Exemplo:
--		filter (>5) [1,2,3,4,5,6,7,8] => [6,7,8]            --	Todos os números maiores 
--		filter (<0) [-2,-1,0,1,2,3,4] => [-2,-1]            --	Todos os números negativos
--		filter (/='C') "Casa" => "asa"                      --	Todos os caracteres diferentes de 'C'
--		filter odd [3,6,7,9,12,14] => [3,7,9]				--	Todos os elementos ímpares

--	5) foldl:
--				
--	Exemplo:
--		foldl (+) 0 [4,2,4] => 10		--	0+4+2+4 = 10
--		foldl (/) 64 [4,2,4] => 2.0		--	64/4 = 16, 16/2 = 8, 8/4 = 2.0
--		foldl max 5 [1,2,3,4] => 5		--	max 5 1 = 5, max 5 2 = 5, max 5 3 = 5, max 5 4 = 5 => 5
--		foldl max 5 [4,5,6,7] => 7		--	max 5 4 = 5, max 5 5 = 5, max 5 6 = 6, max 6 7 = 7 => 7

--	6) foldr:
--		
--	Exemplo:
--		foldr (/) 64 [4,2,4]  => 0.125	--	4/64 = 0.0625, 2/0,0625 = 32, 4/32 = 0.125 
--		foldr (/) 64 [4,2]    => 2/64   --	2/64 = 0.03125‬, 4/0.03125‬ = 128.0 
--		foldr (+) 5 [1,2,3,4] => 15     --	5+4 = 9, 9+3 = 12, 12+2 = 14, 14+1 = 15
--		foldr (/) 2 [8,12,24,4]	=>      --	4/2 = 2, 24/2 = 12, 12/12 = 1, 8/1 = 8.0
--		foldr (++)[] [[1],[2],[3]] => [1,2,3]  --	[3]++[] = [3], [2]++[3] = [2,3], [1]++[2,3] => [1,2,3]

--	7) sum:
--		Soma os elementos de uma lista
--	Exemplo:
--		sum [1..5] => 15

--	8) product:
--		Gera o produto de todos os elementos da lista
--	Exemplo:
--		product [1..3] => 6

--	OUTRAS:

--	1) succ:
--		Retorna o sucessor do elemento digitado
--	Exemplo:
--		succ 8 => 9

--	2) pred:
--		Retorna o antecessor do elemento digitado
--	Exemplo:
--		pred 8 => 7

--	OPERAÇÕES BASICAS
--	Soma:
soma :: (Float, Float) -> Float            --	Definição da função => Entra dois valores em Float e retorna um valor em Float
soma(x,y) = x + y

--	Subtração:
subtracao :: (Float, Float) -> Float
subtracao(x,y) = x - y

--	Produto:
produto :: (Float, Float) -> Float
produto(x,y) = x * y

--	Divisão:
divisao :: (Float, Float) -> Float
divisao(x,y) = x / y

--	Potenciação:
pot :: (Float, Float) -> Float
pot(x,y) = x ** y

--	Radiciação:
raiz :: (Float, Float) -> (Float)
raiz(x,y) = x**(1/y)

--	Dobro:
dobro :: Float -> Float
dobro x = 2 * x

--	Triplo:
triplo :: Float -> Float
triplo x = x * 3

--	Quadruplo:
quadruplo :: Float -> Float
quadruplo x = dobro (dobro x)

--	Radiciação (Segunda forma de apresentação)
--	casamento de padrao
--	sequencialmente ver em quem ele se encaixa
raiz2 :: Float -> Float -> (Float)
raiz2 x y = x**(1/y)

--	TRABALHANDO COM LISTAS E TUPLAS
--	(False, False) tupla
--	[False, False] lista

--	LISTAS

--	"x !! y" => 										retorna o valor correpondente ao indice y na lista x
--	o operador '..' em uma lista, monta o restante da lista conforme o padrão no começo
--	Exemplo:
--	[0..5]	=>	[0,1,2,3,4,5]
--	[1..4]	=>	[1,2,3,4]
--	[0..5]	=>	[0,1,2,3,4,5]
--	[10,9..1] => [10,9,8,7,6,5,4,3,2,1]				Lista descrescendo
--	[10..1] => []									Retorna uma lista vazia
--	['A'..'F'] => "ABCDEF"
--	[0,2..10] => [0, 2, 4, 6, 8, 10]			    Define um padrão para a formação da lista(par nesse caso)
--	[0,3..10] => [0,3,6,9]							(Triplo a partir de 3)
--	[1..]	  => 									Lista infinita
--	[1..] !! 999 => 1000							Retorna o elemento 999 da lista infinita
--	'A':" small cat"	=>	"A small cat"

--	OPERAÇÕES COM LISTAS:
--	head, tail, init, last, null, length, reverse, take, drop;

--	[1..5] ++ [6..10] => [1,2,3,4,5,6,7,8,9,10]		Juntando duas listas
--	0:[1..5] => [0, 1, 2, 3, 4, 5]					Adiciona elemento na cabeça da lista
--	head [1..5] => 1								Cabeça da lista
--	tail [1..5] => [2, 3, 4, 5]						Cauda da lista
--	init [1..5] => [1, 2, 3, 4]						Inicio da lista
--	last [1..5] => 5								Último elemento da lista
--	null [1..5] => False							Retorna se a lista é vazia
--	length [1..5] => 5								Mede o tamanho da lista
--	length "Casa" => 4
--	reverse "Casa" => "asaC"						Inverte uma lista
--	reverse [1..5] => [5,4,3,2,1]
--	take 3 [0..5] => [0,1,2]						retira 3 elementos da lista, começando pelo inicio e 
--													retorna uma lista com os elementos retirados
--	drop 2 [0..6] => [2,3,4,5,6]					remove 2 elementos da lista e retorna a lista original sem os elementos



--	ZIP

--	zip "HillValley" "HillDale" => [('H','H'),('i','i'),('l','l'),('l','l'),('V','D'),('a','a'),('l','l'),('l','e')]
--													Concatena as duas listas em TUPLAS(	[a] -> [b] -> [(a,b)])
--	zip "Casa" "Bola" => [('C','B'),('a','o'),('s','l'),('a','a')]
--	zip [1,2,3] [4,5,6]	=> [(1,4),(2,5),(3,6)]



--	UNZIP: Retorna uma tupla com a lista originial


--	unzip [('C','B'),('a','o'),('s','l'),('a','a')] => ("Casa","Bola")  Retorna uma tupla com a lista originial
--	unzip [(1,4),(2,5),(3,6)] => ([1,2,3],[4,5,6])


--	ZIPWITH:	Concatena e faz a operação entre duas listas


--	zipWith (+) [1,2,3] [3,2,1] => [4,4,4]			
--	zipWith (\x y -> 2*x + y) [1..4] [5..8] => [7,10,13,16]

--	List Comprehension:
--	É uma maneira de filtrar, transformar e combinar listas
--	Exemplo:
--	[x*2 | x <- [1..10]] => [2,4,6,8,10,12,14,16,18,20]		Armazena em x a lista de 1-10 e retorna a lista 
--															com os elementos dobrados
--	[x | x <- [50..100], x `mod` 7 == 3] => [52,59,66,73,80,87,94]	armazena em x a lista de elementos entre 50-100
--													que cada o resto da divisão de cada elemento por 7 tenha resto 3
--	Com condicional estabelecida:
--	[x*2 | x <- [1..5], x*2 > 4] => [6, 8, 10]	Armazena em x a lista 1-5
--	Passo a passo: x = [1,2,3,4,5], saida "x*2" = [2,4,6,8,10], com a condicional saida = [3,4,5] para x*2 saida = [6,8,10]
--	"x <- [1..5], x*2 > 4" gera a uma lista [3,4,5] e a saida dobra essa lista, saida = [6,8,10]


--	Cabeça da lista Int
cabeca_lista_int:: [Int] -> Int
cabeca_lista_int x = head x

--	Cauda da lista Int
cauda_lista_int:: [Int] -> [Int]
cauda_lista_int x = tail x

--	Inicio da lista Int
inicio_lista_int:: [Int] -> [Int]
inicio_lista_int x = init x

--	Último elemento da lista Int
ultimo_lista_int:: [Int] -> Int
ultimo_lista_int x = last x

--	Retorna o caractere na posicao determinada
charPos:: (String, Int) -> (Char)
charPos(x, y) = x !! y

--	Conta até um determinado valor a partir de zero
conta_ate :: Integer -> [Integer]
conta_ate n = [0..n]

--	TUPLAS:
--
--	Tuplas podem ter n elementos. Para tuplas de tamanho 2, ou seja, pares, para acessar cada elemento é possível utilizar os prefixos fst ou snd.
--	**Estes operadores não funcionam pra tuplas maiores	
-- 	accessing elements of a pair (i.e. a tuple of length 2)
-- 	fst ("haskell", 1) -- "haskell"
--	snd ("haskell", 1) -- 1

-- Exemplo: ("haskell", 1)


-- OUTRAS OPERACOES

--	1) Retorna o menor valor dentre dois inteiros

mini :: Int -> Int -> Int -- função que mostra o menor valor entre dois inteiros
mini a b
       | a <= b = a
       | otherwise = b   

--	2) Fatorial

--	Método 1:

fat :: Int -> Int
fat n
    | n == 0 = 1
    | otherwise = n * fat(n-1)

--	Método 2:

fat2 n | n == 0 = 1 | otherwise = fat2 (n - 1) * n

--	3) Fibonnacci

--	Elemento único
--	Método 1:

fib :: Int -> Int
fib n
    | n == 1 = 1
    | n == 2 = 1
    | otherwise = fib(n - 1) + fib(n - 2)

--	Método 2: Ramificando a função

fib2 x
     | x < 2 = 1
     | otherwise = fib2 (x - 1) + fib2 (x - 2)

--	Método 3: Três equações definindo a função

fib3 1 = 1
fib3 2 = 2
fib3 x = fib3 (x - 1) + fib3 (x - 2)


--	Lista de elementos

--fibListaAux:: Int -> Int
--fibListaAux 1 = 1
--fibListaAux 2 = 1
--fibListaAux n = fibLista(n - 1) + fibLista(n - 2)

fibLista:: Int -> [Int]
fibLista 1 = [1]
fibLista 2 = [1,1]
fibLista n = fibLista(n-1) ++ fibLista(n - 2)
--         | n == 1 = [1]
--         | n == 2 = [1,1]
--         | otherwise = fibLista(n - 1) + fibLista(n - 2)

-- pra achar números primos
-- primes = sieve [ 2 . . ]
-- sieve (x:xs) = x : sieve [y | y <− xs, y ‘mod‘ x /= 0]	-- Algoritmo Sieve of Eratosthenes para gerar números primos
-- isPrime:: Int -> Bool
-- findPrime n (x:xs)
--          n == x = True
--          n < x = False
--          otherwise = findPrime n xs



--	Funções de ordem superior: São Funções que recebem outras funções como parâmetros

--	Exemplo:
--	applyTwice::(a -> a) -> a -> a
--	applyTwice f x = f (f x)

--dobraLista:: [int] -> [int]
--dobraLista [] = []
--dobraLista(x:xs) = 

--	Soma todos os elementos da lista
somaLista:: [Int] -> Int
somaLista [] = 0
somaLista (x:xs) = x + somaLista(xs)	--	'x' é a cabeça da lista e 'xs' o restante 


--	FUNÇÕES POLIMORFICAS: Podem ser substituídas por qualquer tipo (Int, Char, etc...)
--	Exemplos:
--	Operador de concatenação (++):
--	[1, 2] ++ [3, 4] ++ [5, 6]	=>	[1, 2, 3, 4, 5, 6]			(++) :: [t] -> [t] -> [t]

--	Encadeamento de funções a partir do operador '.'
--	foo = (*5) . (+10)
--	foo 5 => 75						Soma 10 ao valor recebido e multiplica por 5



--	CONTROLE DE FLUXO

--	Blocos IF-THEN-ELSE
--	let valor_alternado = if 144 `mod` 6 == 4 then "acertou" else "errou" -- errou

-- É legal identar quando você tem múltiplos branchs para acontecer

--	let valor_alternado = if 144 `mod` 6 == 4
--                      then "acertou"
--                      else "errou"

-- Blocos CASE

{- caso <argumento> seja :
        <ajuda>  -> mostra_ajuda
        <inicia> -> inicia_programa
        <_>      -> putStrLn "ExArgumentoInvalido"

    Onde `_` Significa Qualquer Outra Coisa.
-}


--	case args of
--     "ajuda"  -> mostra_ajuda
--     "inicia" -> inicia_programa
--     _        -> putStrLn "ExArgumentoInvalido"


--	FUNÇÕES COMPOSTAS:
--		É utilizado o operador '.' para estabelecer a composição de funções.
--	Exemplo: foo = (4*) . (10+)    --	Composição entre a função de soma e multiplicação
--			 foo 5 => 60           --	4*(10+5) = 60










