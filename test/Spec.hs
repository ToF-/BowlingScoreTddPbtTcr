import Test.QuickCheck
import Bowling

check s p = do
    putStr ("\n" ++ s ++ ": ")
    quickCheck p

main = do
    check "dummy" prop_Dummy


prop_Dummy :: Int -> Bool
prop_Dummy x = x == x 

prop_AverageFramesResultInSumOfThrows ts =
    score ts == sum ts
