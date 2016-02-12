{-# LANGUAGE OverloadedStrings, ScopedTypeVariables #-}
import Prelude
import Data.List
import Data.Char
import Geometry

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub


wordNums :: String -> [(String,Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words


isInfixOf' :: Eq a => [a] -> [a] -> Bool
n `isInfixOf'` h = any (n `isPrefixOf`) (tails h)


encode :: Int -> [Char] -> [Char]
--encode n s = map chr . map (+n) . map ord $ s
encode offset msg = map (chr . (+offset) . ord) $ msg


decode :: Int -> [Char] -> [Char]
decode offset msg = encode (negate offset) msg



firstToN n = find (isSumN) [1..]
              where isSumN = (== n) . digitSum
              
firstToForty = firstToN 40

                    
digitSum :: Int -> Int
digitSum = sum . map (digitToInt) . show


phoneBook = 
    [("betty","555-2938")
    ,("patsy","493-2928")
    
--
--phonebookToMap :: (Ord k) => [(k, String)] -> M.Map k String
--phonebookToMap xs = M.fromListWith add xs
--                  where add num1 num2 = num1 ++ ", " ++ num2
--
--



