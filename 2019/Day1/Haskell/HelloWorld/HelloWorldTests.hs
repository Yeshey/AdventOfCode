-- https://adventofcode.com/2019
-- Haskell book: http://learnyouahaskell.com/

{-

# Starting Out

Testing for equality
ghci> 5 == 5  
True  
ghci> 1 == 0  
False  
ghci> 5 /= 5  
False  
ghci> 5 /= 4  
True  
ghci> "hello" == "hello"  
True 

Surround negative numbers with parenthisis
5 * (-3)

Take the first 10 numbers from an infinite list that goes 2,4,...
take 10 [2,4..]

[x | x <- [50..100], x `mod` 7 == 3]

zip [1..] ["apple", "orange", "cherry", "mango"]  

let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]


# Types and typeclasses

ghci> :t 20  
20 :: (Num t) => t  
It appears that whole numbers are also polymorphic constants. They can act like any type that's a member of the Num typeclass.

fromIntegral (length [1,2,3,4]) + 3.2
bc lengh has a type signature length :: [a] -> Int
when it probabily should be (Num b) => length :: [a] -> b

# Syntax in Functions

sayMe :: (Integral a) => a -> String  
sayMe 1 = "One!"  
sayMe 2 = "Two!"  
sayMe 3 = "Three!"  
sayMe 4 = "Four!"  
sayMe 5 = "Five!"  
sayMe x = "Not between 1 and 5"  

recursive factorial

factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1)  

ghci> (let (a,b,c) = (1,2,3) in a+b+c) * 100  


calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]  
We can't use the bmi name in the (w, h) <- xs part because it's defined prior to the let binding.


case expressions, thses two are the same:

head' :: [a] -> a  
head' [] = error "No head for empty lists!"  
head' (x:_) = x  

head' :: [a] -> a  
head' xs = case xs of [] -> error "No head for empty lists!"  
                      (x:_) -> x  

syntax for case:
case expression of pattern -> result  
                   pattern -> result  
                   pattern -> result  
                   ...  

you can have cases anywhere:
describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                               [x] -> "a singleton list."   
                                               xs -> "a longer list." 

whilst the functions syntax is just for functions
describeList :: [a] -> String  
describeList xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [x] = "a singleton list."  
          what xs = "a longer list."  
-}

import System.IO  
import Control.Monad

{-
main :: IO ()
main = do
    let result = removeNonUppercase "Hello, World!"
    putStrLn result


[1,2,3] is just syntactic sugar for 1:2:3:[]
-}

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

{-
main :: IO ()
main = do
  let vector1 = (1, 2)
      vector2 = (3, 4)
      result = addVectors vector1 vector2
  putStrLn $ "The sum of " ++ show vector1 ++ " and " ++ show vector2 ++ " is " ++ show result
-}

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors a b = (fst a + fst b, snd a + snd b)  

-- rewrite as pattern matchin, not that this is already the catch-all pattern
addVectors' :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)  

first :: (a,b,c) -> a
first (a,_,_) = a

{-
main :: IO ()
main = do
  let testCases = [ 1,2,3,4,5 ]
  let lenghy = length' testCases
  putStrLn $ "Testing the length' function: " ++ show lenghy
-}

length' :: (Num b) => [a] -> b  
length' [] = 0  
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a  
sum' [] = 0  
sum' (x:xs) = x + sum' xs 

{-
main :: IO ()
main = do
  putStrLn (bmiTell 53 1.71)
-}

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  
          skinny = 18.5  -- indentation in the where block is inportant
          normal = 25.0  
          fat = 30.0  
-- You could even
-- where bmi = weight / height ^ 2 
--      (skinny, normal, fat) = (18.5, 25.0, 30.0)  


max' :: (Ord a) => a -> a -> a  
max' a b 
    | a > b = a
    | otherwise = b

--Using a function in a function
calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi w h | (w, h) <- xs]  
    where bmi weight height = weight / height ^ 2  

main :: IO ()
main = do
  let radius = 2.5
      height = 10.0
      volume = cylinder radius height
  putStrLn $ "The volume of a cylinder with radius " ++ show radius ++ " and height " ++ show height ++ " is " ++ show volume

cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea  