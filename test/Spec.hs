import Test.QuickCheck
import Bowling

check s p = do
    putStr ("\n" ++ s ++ ": ")
    verboseCheck p


data Frame = Average Int Int
    deriving (Eq,Show)

instance Arbitrary Frame where
    arbitrary = do
        t1 <- choose (0,9)
        t2 <- choose (0,9-t1)
        return (Average t1 t2)

arbitraryAverageGame :: Gen [Frame]
arbitraryAverageGame = do
    n <- choose (0,10) :: Gen Int
    sequence [arbitrary | _ <- [0..n]]




main = do
    check "average frames result in sum of throws"
        prop_AverageFramesResultInSumOfThrows

prop_AverageFramesResultInSumOfThrows ts =
    score ts == sum ts
