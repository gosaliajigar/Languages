{-
  --------------------------------------------------------------------------------------------------------------
   Program     : controlStructures.hs
   Professor   : Richard Riehle
   Programmer  : Jigar Gosalia (89753)
   Description : Learn if-then-else in Haskell.
   References  : https://lotz84.github.io/haskellbyexample/ex/if-else
  ---------------------------------------------------------------------------------------------------------------
-}

main = do
     putStrLn ""
     putStrLn ""

     if 7 `mod` 2 == 0
         then putStrLn "7 is even"
         else putStrLn "7 is odd"

     if 8 `mod` 4 == 0
         then putStrLn "8 is divisible by 4"
         else return ()

     let num = 9
     putStrLn $
        if num < 0
            then show num ++ " is negative"
            else if num < 10
                    then show num ++ " has 1 digit"
                    else show num ++ " has multiple digits"

     putStrLn ""
     putStrLn ""
