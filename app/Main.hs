module Main where

import Lib

main :: IO ()
main = do putStrLn "Calculator starting.... "
          calculator

calculator = do line <- getLine
                if line == "exit"
                    then return ()
                    else do
                        putStrLn "Let's math"
                        calculator