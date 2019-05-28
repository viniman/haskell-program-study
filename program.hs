-------------- http://learnyouahaskell.com/ ------------------



{-
succ
min
max
let
++
:
!!
head
tail
last
init
head - tail
init - last
length
null
reverse
take
drop
minimum
maximum
sum
product
elem
[1,2,4..100]
[a,b..z]
cycle [1,2,3]
take 10 (cycle [1,2,3])
take 10 (repeat 5)
replicate
even
odd


List Comprehension
[x + x | x <- [1..10]]
[x*2 | x <- [1..10]]
[x*2 | x <- [1..10], x*2 >= 12]
[ x | x <- [50..100], x `mod` 7 == 3]
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
[ if x < 10 then "BOOM!" else "BANG!" | x <- [1..20], odd x]
[ x | x <- [10..20], x /= 13, x /= 15, x /= 19]
[ x*y | x <- [2,5,10], y <- [8,10,11]]
[ x*y | x <- [2,5,10], y <- [8,10,11], x == 11]
[ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50] 

let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]  
[ [ x | x <- xs, even x ] | xs <- xxs]  

[x * x | x <- [9 ..39], mod x 2 == 0]
[(x,x * x) | x <- [9 ..39], mod x 2 == 0]


---- TUPLAS ----
fst -> para pairs
snd -> para pairs
zip [1,2,3] [1,2,3]-> list of pairs
zip [1..] ["apple", "orange", "cherry", "mango"] 

let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ] 
let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]   
let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]  


-- Haskell trabalha em cima de recursao
-- Haskell trbaalha com casamento de padroes
-- Guardas "|" é um jeito simples de representar funcoes recursivas

--------------------------------------------------------
-}


doubleMe :: Int -> Int
doubleMe x = x + x

doubleUs :: Int -> Int -> Int
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber :: Int -> Int
doubleSmallNumber x = if x > 100
						then x
						else x*2

doubleSmallNumber' :: Int -> Int
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1  


-- length with List Comprehension
length' :: [a] -> Int
length' xs = sum [1 | _ <- xs]   

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']] 

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

fat :: Int -> Int
fat x = product [1..x]

-- Eq - Igualdade (= /=)
-- Ord - Ordenação (> < >= <=)
-- Show - imprimir tudo como String
-- Read - oposto de Show, pega uma String
-- Num

-- Pattern matching - Correspondencia de padrão - Casamento de padrão


lucky :: (Integral a) => a -> String  
lucky 7 = "LUCKY NUMBER SEVEN!"  
lucky x = "Sorry, you're out of luck, pal!"

sayMe :: (Integral a) => a -> String  
sayMe 1 = "One!"  
sayMe 2 = "Two!"  
sayMe 3 = "Three!"  
sayMe 4 = "Four!"  
sayMe 5 = "Five!"  
sayMe x = "Not between 1 and 5"  


factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1) 

charName :: Char -> String  
charName 'a' = "Albert"  
charName 'b' = "Broseph"  
charName 'c' = "Cecil"  
charName c = "No name with letter " ++ [c]

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectorsWithPatternMatching :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectorsWithPatternMatching (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- Version of fst and snd for triples
first :: (a, b, c) -> a  
first (x, _, _) = x  
  
second :: (a, b, c) -> b  
second (_, y, _) = y  
  
third :: (a, b, c) -> c  
third (_, _, z) = z  

tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y  

-- length usando pattern matching
length'' :: (Num b) => [a] -> b  
length'' [] = 0  
length'' (_:xs) = 1 + length'' xs

sum' :: (Num a) => [a] -> a  
sum' [] = 0  
sum' (x:xs) = x + sum' xs 


-- xs@(x:y:ys)
capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x] 


-- Guardas 
-- BMI: body mass index
bmiTellTx :: (RealFloat a) => a -> String  
bmiTellTx bmi  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!" 

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise                 = "You're a whale, congratulations!"  


max' :: (Ord a) => a -> a -> a  
max' a b   
    | a > b     = a  
    | otherwise = b  

-- max' :: (Ord a) => a -> a -> a  
-- max' a b | a > b = a | otherwise = b  

myCompare :: (Ord a) => a -> a -> Ordering  
myCompare a b -- a `myCompare` b
    | a > b     = GT  
    | a == b    = EQ  
    | otherwise = LT 

bmiTellWhere :: (RealFloat a) => a -> a -> String  
bmiTellWhere weight height  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  


-- It also improves readability by giving names to things
bmiTellReadability :: (RealFloat a) => a -> a -> String  
bmiTellReadability weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "Yoiu're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "Yoiu're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  
          skinny = 18.5  
          normal = 25.0  
          fat = 30.0  

-- ...  
-- where bmi = weight / height ^ 2  
--       (skinny, normal, fat) = (18.5, 25.0, 30.0)  


initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where (f:_) = firstname  
          (l:_) = lastname   


calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi w h | (w, h) <- xs]  
    where bmi weight height = weight / height ^ 2  



-- Let it be

cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea  

-- [if 5 > 3 then "Woo" else "Boo", if 'a' > 'b' then "Foo" else "Bar"]
-- 4 * (if 10 > 5 then 10 else 0) + 2 
-- 4 * (let a = 9 in a + 1) + 2  
-- [let square x = x * x in (square 5, square 3, square 2)]  
-- (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)
-- (let (a,b,c) = (1,2,3) in a+b+c) * 100  

calcBmis' :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2] 

calcBmis'' :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis'' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0] 


maximum' :: (Ord a) => [a] -> a  
maximum' [] = error "maximum of empty list"  
maximum' [x] = x  
maximum' (x:xs)   
    | x > maxTail = x  
    | otherwise = maxTail  
    where maxTail = maximum' xs

maximum'' :: (Ord a) => [a] -> a  
maximum'' [] = error "maximum of empty list"  
maximum'' [x] = x  
maximum'' (x:xs) = max x (maximum'' xs)  

replicate' :: (Num i, Ord i) => i -> a -> [a]  
replicate' n x  
    | n <= 0    = []  
    | otherwise = x:replicate' (n-1) x  

take' :: (Num i, Ord i) => i -> [a] -> [a]  
take' n _  
    | n <= 0   = []  
take' _ []     = []  
take' n (x:xs) = x : take' (n-1) xs  



reverse' :: [a] -> [a]  
reverse' [] = []  
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]  
repeat' x = x:repeat' x  

-- repeat' fornece uma lista repitida infinita
-- Usar take para pegar um tamanho necessario
-- take' 5 (repeat' 3)

zip' :: [a] -> [b] -> [(a,b)]  
zip' _ [] = []  
zip' [] _ = []  
zip' (x:xs) (y:ys) = (x,y):zip' xs ys  

elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
	| x == a = True
	| otherwise = elem' a xs

quickSort :: (Ord a) => [a] -> [a]  
quickSort [] = []  
quickSort (x:xs) =   
    let smallerSorted = quickSort [a | a <- xs, a <= x]  
        biggerSorted = quickSort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted 


-- Funcoes de ordem superior
-- Funcoes que podem ser usadas como parametros e ser retornadas de uma funcao



----------------------------------------------------
-- https://learnxinyminutes.com/docs/pt-br/haskell-pt/
-- http://edirlei.3dgb.com.br/aulas/clp/ListaExercicios07.pdf

calcCirc :: Float -> Float
calcCirc r = pi * r^2



-- ehPrimo :: Int -> String
-- ehPrimo x
-- 	| x / 

whatNumeric :: Int -> Int
whatNumeric num
	| num > 0 = 1
	| num < 0 = -1
	| otherwise = 0

whatNumeric' :: (Num a, Ord a) => a -> Int
whatNumeric' num
	| num > 0 = 1
	| num < 0 = -1
	| otherwise = 0

operations ::  Char -> Integer -> Integer -> Integer
operations op n1 n2
	| op == '*' = n1*n2
 	| op == '/' = n1*n2
 	| op == '-' = n1-n2
 	| op == '+' = n1+n2
 	| otherwise = error "ERRO: esta funcao nao esta implementada!"


-- operations' :: (Eq op) => Char -> Integer -> Integer -> Float
-- operations' op n1 n2
-- operations' '*' = n1*n2
-- operations' '/' = n1*n2
-- operations' '-' = n1-n2
-- operations' '+' = n1+n2




{- foldl computação é feita esquerda para direita
   foldr computação é feita  direita para esquerda

   Você pode usar foldl or foldr a fim de reduzir uma lista
   fold(l||r) <funcao> <valor inicial> <lista>
-}



and' :: Bool -> Bool -> Bool
and' True True = True
and' _ _ = False

or' :: Bool -> Bool -> Bool
or' False False = False
or' _ _ = True

or_exclusive :: Bool -> Bool -> Bool
or_exclusive True False = True
or_exclusive False True = True
or_exclusive _ _ = False

pertence :: (Eq a) => [a] -> a -> Bool
pertence [] _ = False
pertence (x:xs) n
	| x == n = True
	| otherwise = pertence xs n 

maior :: [Int] -> Int
maior [x] = x
maior (x:xs)
	| x > maior xs = x
	| otherwise = maior xs 

todos_pares :: [Int] -> Bool
todos_pares [] = False
todos_pares [x] | (mod x 2 == 0) = True
todos_pares (x:xs)
	| (mod x 2 /= 0) = False
	| otherwise = todos_pares xs

firstThat :: (a -> Bool) -> a -> [a] -> a
firstThat f = foldr (\x acc -> if f x then x else acc)

lastThat :: (a -> Bool) -> a -> [a] -> a
lastThat f  = foldl (\acc x -> if f x then x else acc) 

-- foldr e foldl
-- acc = acumulador
-- x = elemento atual

argmax :: (Ord b) => (a -> b) -> [a] -> a
argmax f [x] = x
argmax f (x:xs) = if f x > f (argmax f xs)
				  then x
				  else (argmax f xs)

argmax' :: (Ord b) => (a -> b) -> [a] -> a
argmax' f = foldl1(\acc x -> if f x > f acc then x else acc)

-- map ((1+) . (1+) . (1+)) [1..4]


-- WHERE CLAUSE
roots :: (Float, Float, Float) -> (Float, Float)  
roots (a,b,c) = (x1, x2) where 
   x1 = e + sqrt d / (2 * a) 
   x2 = e - sqrt d / (2 * a) 
   d = b * b - 4 * a * c  
   e = - b / (2 * a)  
main = do 
   putStrLn "The roots of our Polynomial equation are:" 
   print (roots(1,-8,6))


numSolsReaisEq2Grau :: Float -> Float -> Float -> Int
numSolsReaisEq2Grau a b c
    | delta > 0  = 2
    | delta == 0 = 1
    | otherwise = 0
        where
        delta = b^2 - 4*a*c

dobrarLista :: (Num a) => [a] -> [a]
dobrarLista list = map dobro list
	where dobro x = x*2

dobrarListaLet :: (Num a) => [a] -> [a]
dobrarListaLet list =
	let dobro x = x*2
	in map dobro list

multby10 :: [Float] -> [Float]
multby10 list = map mult list
	where mult x = x*10

herao :: Float -> Float -> Float -> Float
herao a b c = sqrt (s * (s - a) * (s - b) * (s - c))
    where
    s = (a + b + c) / 2

areaTriangTrig :: Float -> Float -> Float -> Float
areaTriangTrig  a b c = c * altura / 2   -- usando trigonometria
    where
    cosa    = (b ^ 2 + c ^ 2 - a ^ 2) / (2 * b * c)
    sina    = sqrt (1 - cosa ^ 2)
    altura  = b * sina

areaTriangHerao :: Float -> Float -> Float -> Float
areaTriangHerao a b c = resultado        -- usa a fórmula de Herão
    where
    resultado = sqrt (p * (p - a) * (p - b) * (p - c))
    p       = (a + b + c) / 2


-- Pontos creditados a um piloto de acordo com sua classificacao final
pts :: Int -> Int
pts x =
    if x == 1
        then 10
        else if x == 2
            then 6
            else if x == 3
                then 4
                else if x == 4
                    then 3
                    else if x == 5
                        then 2
                        else if x == 6
                            then 1
                            else 0


ptsFacilLegivel :: Int -> Int
ptsFacilLegivel 1 = 10
ptsFacilLegivel 2 = 6
ptsFacilLegivel 3 = 4
ptsFacilLegivel 4 = 3
ptsFacilLegivel 5 = 2
ptsFacilLegivel 6 = 1
ptsFacilLegivel _ = 0


ptsGuardas :: Int -> Int
ptsGuardas x
	| x == 1 = 10
	| x == 2 = 6
	| x == 3 = 4
	| x == 4 = 3
	| x == 5 = 2
	| x == 6 = 1
	| otherwise = 0


-- misturar casamento de padrao e guardas
ptsOutro :: Int -> Int
ptsOutro 1 = 10
ptsOutro 2 = 6
ptsOutro x
    | x <= 6    = 7 - x
    | otherwise = 0


-- Associacoes let
-- where é: <expressões> where <associações>
-- let <associações> in <expressões>

solucaoPadrao :: Float -> Float -> Float -> (Float, Float)
solucaoPadrao a b c = 
    ( (-b + sqrt(b * b - 4 * a * c)) / (2 * a)
    , (-b - sqrt(b * b - 4 * a * c)) / (2 * a) )

solucaoWhere :: Float -> Float -> Float -> (Float, Float)
solucaoWhere a b c = 
    ( (-b + raizDelta) / (2 * a)
    , (-b - raizDelta) / (2 * a) )
        where raizDelta = sqrt(b * b - 4 * a * c)

solucaoLet :: Float -> Float -> Float -> (Float, Float)
solucaoLet a b c =
    let raizDelta = sqrt(b * b - 4 * a * c)
    in  ( (-b + raizDelta) / (2 * a)
        , (-b - raizDelta) / (2 * a) )