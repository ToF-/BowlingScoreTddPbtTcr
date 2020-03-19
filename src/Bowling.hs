module Bowling
where

score :: [Int] -> Int
score ts = min 90 (sum ts)

