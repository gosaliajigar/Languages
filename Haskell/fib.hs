{-
  --------------------------------------------------------------------------------------------------------------
   Program     : fib.hs
   Professor   : Richard Riehle
   Programmer  : Jigar Gosalia (89753)
   Description : Learn functions in Haskell.
   Usage       : Load file in WinGHCi and run "fib n" where n is the nth number in Fibonacci Series.
  ---------------------------------------------------------------------------------------------------------------
-}

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)