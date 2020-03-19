import Test.QuickCheck
import Bowling

check s p = do
    putStr ("\n" ++ s ++ ": ")
    quickCheck p

main = do
    check "average frames result in sum of throws"
        prop_AverageFramesResultInSumOfThrows

prop_AverageFramesResultInSumOfThrows ts =
    score ts == sum ts
