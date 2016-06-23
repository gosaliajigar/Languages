{-
  --------------------------------------------------------------------------------------------------------------
   Program     : stringFunctions.hs
   Professor   : Richard Riehle
   Programmer  : Jigar Gosalia (89753)
   Description : Learn String Functions in Haskell.
   References  : https://lotz84.github.io/haskellbyexample/ex/string-functions
  ---------------------------------------------------------------------------------------------------------------
-}

import Data.List
import Data.Char

include :: String -> String -> Bool
include xs ys = or . map (isPrefixOf ys) . tails $ xs

joinWith :: [String] -> String -> String
joinWith xs sep = concat . init . concat $ [[x, sep] | x <- xs]

split :: String -> Char -> [String]
split "" _ = []
split xs c = let (ys, zs) = break (== c) xs
             in  if null zs then [ys] else ys : split (tail zs) c

main = do
     putStrLn ""
     putStrLn ""
     putStrLn "Input string is 'hello world' ..... "
     putStrLn ""
     putStrLn ""
     putStrLn $ "String contains 'lo'           : " ++ show ("hello world" `include` "lo")
     putStrLn $ "String count 'l'               : " ++ show (length . filter (=='l') $ "hello world")
     putStrLn $ "String hasPrefix 'wo'          : " ++ show (isPrefixOf "wo" "world")
     putStrLn $ "String hasSuffix 'lo'          : " ++ show (isSuffixOf "lo" "hello")
     putStrLn $ "String index 'o'               : " ++ show (elemIndex 'o' "hello world")
     putStrLn $ "String join strings            : " ++ show (["hello", "world"] `joinWith` "-")
     putStrLn $ "String repeat 'a' 5 times      : " ++ show (replicate 5 'a')
     putStrLn $ "String replace 'o' with '0'    : " ++ show (map (\x -> if x == 'o' then '0' else x) "hello world")
     putStrLn $ "String split by delimiter '-'  : " ++ show (split "spilt-hello-world" '-')
     putStrLn $ "String toLower                 : " ++ map toLower "hello world"
     putStrLn $ "String toUpper                 : " ++ map toUpper "hello world"
     putStrLn $ "String length                  : " ++ show (length "hello world!!")
     putStrLn $ "String character at location 1 : " ++ show ("hello world" !! 1)
     putStrLn ""
     putStrLn ""
