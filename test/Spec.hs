import Test.QuickCheck

main = quickCheck prop_Dummy


prop_Dummy :: Int -> Bool
prop_Dummy x = x == x 
