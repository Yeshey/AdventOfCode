-- Open AI's chat bot solution
-- https://chat.openai.com/chat

import qualified Data.Map.Strict as Map
import qualified Data.Sequence as Seq
import qualified Data.Text as Text
import Intcode

main :: IO ()
main = do
  input <- readFile "input.txt"
  let points = tractorBeamPoints input
  putStrLn $ "Number of points affected by the tractor beam: " ++ show points

tractorBeamPoints :: String -> Int
tractorBeamPoints program =
  let
    -- Parse the input program into an Intcode program.
    intcode = parseProgram program

    -- Create a map of visited coordinates and their tractor beam values.
    visited = Map.fromList [((x, y), tractorBeamAt x y) | x <- [0..49], y <- [0..49]]

    -- Count the number of points with a value of 1 in the visited map.
    count = Map.foldl (\acc value -> if value == 1 then acc + 1 else acc) 0 visited

    -- Run the Intcode program to determine the tractor beam value at a given point.
    tractorBeamAt x y =
      let
        -- Initialize the Intcode computer with the input program and input values.
        computer = initialComputer {inputs = Seq.fromList [x, y]}
        -- Run the Intcode program until it halts or waits for input.
        result = runProgram intcode computer
      in
        -- Return the first output value of the Intcode program.
        head (outputs result)
  in
    count 
