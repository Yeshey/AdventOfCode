main :: IO ()
main = do
  let chainRes = chain 194
  let numLongChainsRes = numLongChains
  putStrLn $ "The answer is " ++ show numLongChainsRes

chain :: (Integral a) => a -> [a]  
chain 1 = [1]  
chain n  
    | even n =  n:chain (n `div` 2)  
    | odd n  =  n:chain (n*3 + 1)  
    
numLongChains' :: Int  
numLongChains' = length (filter isLong (map chain [1..1000]))  
    where isLong xs = length xs > 15  

numLongChains' :: Int  -- Using a lambda
numLongChains' = length (filter (\xs -> length xs > 15) (map chain [1..100]))  

-- This is the same as
flip' :: (a -> b -> c) -> b -> a -> c  
flip' f = \x y -> f y x  

-- this
flip' :: (a -> b -> c) -> b -> a -> c  
flip' f x y = f y x