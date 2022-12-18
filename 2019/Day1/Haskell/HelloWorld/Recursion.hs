main :: IO ()
main = do
  let replicateResult = replicate' 4 10
  let takeResult = take' 3 [1..10]
  let reverseResult = reverse' [1..10]
  let repeatResult = repeat' 5
  let zipResult = zip' [1..5] ['a'..'e']
  let elemResult = 11 `elem'` [1..10]
  let quicksortResult = quicksort [1,3,2,5,10,9,8,12]
  let allBiggerResult = allBigger 4 [1..10]
  let allSmallerResult = allSmaller 4 [1..10]
  putStrLn $ "Result: " ++ show quicksortResult

replicate' :: (Num a, Ord a) => a -> b -> [b]
replicate' n x
  | n <= 0  = []
  | otherwise = x:replicate' (n-1) x

take' :: (Num a, Ord a) => a -> [b] -> [b]
take' n _ 
  | n <= 0     = []
take' _ []     = []
take' x (k:xs) = k:take' (x-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: (Num a, Ord a) => a -> [a]
repeat' x = x:repeat' x

zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool 
elem' _ [] = False
elem' y (x:xs)
  | x == y    = True
  | otherwise = elem' y xs

-- Made it, but not elegant at all
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort (allSmaller x xs) ++ x:quicksort (allBigger x xs)

allBigger :: (Eq a, Ord a) => a -> [a] -> [a]
allBigger _ [] = []
allBigger a (x:xs) = if x > a then
                   x:allBigger a xs
                   else
                   allBigger a xs

allSmaller :: (Eq a, Ord a) => a -> [a] -> [a]
allSmaller _ [] = []
allSmaller a (x:xs) = if x <= a then
                   x:allSmaller a xs
                   else
                   allSmaller a xs


--  the good way
quicksortGood :: (Ord a) => [a] -> [a]  
quicksortGood [] = []  
quicksortGood (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted  