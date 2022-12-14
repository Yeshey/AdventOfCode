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

-}

import System.IO  
import Control.Monad

main = do  
        let list = []
        handle <- openFile "/mnt/DataDisk/PersonalFiles/2021/Projects/Programming/AdventOfCode/2019/Day1/Haskell/input.txt" ReadMode
        contents <- hGetContents handle
        let singlewords = words contents
            list = f singlewords
        print list
        hClose handle

f :: [String] -> [Int]
f = map read