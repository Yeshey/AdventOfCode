import Data.Char (isDigit)

-- Function to parse a line and compute the required sum
parseAndCompute :: String -> Int
parseAndCompute line =
    let firstChar = head $ filter isDigit line  -- Find the first digit
        lastChar = last line                    -- Find the last character
        firstDigit = read [firstChar] :: Int     -- Convert first character to Int
        lastDigit = read [lastChar] :: Int       -- Convert last character to Int
    in firstDigit + lastDigit                    -- Compute sum of first and last digits

-- Function to process the entire input and compute the final result
processInput :: String -> Int
processInput input =
    let linesOfText = lines input      -- Split input into lines
        calibrationValues = map parseAndCompute linesOfText  -- Apply parseAndCompute to each line
    in sum calibrationValues            -- Sum all calibration values

-- Main function to read from input file and output the result
main :: IO ()
main = do
    contents <- readFile "input.txt"    -- Assuming input is stored in "input.txt"
    let result = processInput contents  -- Process the input
    print result                        -- Print the result
