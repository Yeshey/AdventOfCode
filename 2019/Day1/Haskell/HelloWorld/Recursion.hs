main :: IO ()
main = do
  let radius = 2.5
      height = 10.0
  putStrLn $ "The volume of a cylinder with radius and height " ++ show height ++ " is " ++ show radius

replicate' :: (Int a, Ord b) => a -> b -> [b]
replicate' n x
  | n <= 0  = []
  | n x = replicate' (n-1) x