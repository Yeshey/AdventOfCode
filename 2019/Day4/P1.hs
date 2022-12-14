-- Open AI's chat bot solution
-- https://chat.openai.com/chat

import Data.List

-- Split a number into a list of its digits
splitDigits :: Int -> [Int]
splitDigits = map (read . return) . show

-- Check if a number is valid according to the problem's constraints
isValid :: Int -> Bool
isValid n =
  let digits = splitDigits n
  in  and [
        -- Two adjacent digits are the same
        any (uncurry (==)) (zip digits (tail digits)),
        -- Digits never decrease from left to right
        all (uncurry (<=)) (zip digits (tail digits))
      ]

main :: IO ()
main = do
  let lowerBound = 246540
  let upperBound = 787419
  let validPasswords = filter isValid [lowerBound..upperBound]
  putStrLn $ "There are " ++ (show $ length validPasswords) ++ " valid passwords." 
