{-
  --------------------------------------------------------------------------------------------------------------
   Program     : fact.hs
   Professor   : Richard Riehle
   Programmer  : Jigar Gosalia (89753)
   Description : Learn functions in Haskell.
   Usage       : Load file in WinGHCi and run "fact n" where n is the nth number for Factorial.
  ---------------------------------------------------------------------------------------------------------------
-}

fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n - 1)