import Test.QuickCheck
import Bowling

import Control.Monad
import System.Exit

check s prop = do
    putStr ("\n" ++ s ++ ": ")
    result <- quickCheckResult prop
    unless (isSuccess result) exitFailure


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



averageThrows :: Gen [Int]
averageThrows = do
    game <- arbitraryAverageGame
    return (concatMap throws game)
        where
            throws :: Frame -> [Int]
            throws (Average t1 t2) = [t1, t2]

main = do
    check "average frames result in sum of throws"
        (forAll averageThrows prop_AverageFramesResultInSumOfThrows)

    check "average frames result in score <= 90" 
        (forAll averageThrows prop_AverageFramesResultInScoreLE90)

prop_AverageFramesResultInSumOfThrows ts =
    score ts == sum ts

prop_AverageFramesResultInScoreLE90 ts =
    score ts <= 90
