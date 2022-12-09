-- https://adventofcode.com/2019
-- Haskell book: http://learnyouahaskell.com/

{-
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