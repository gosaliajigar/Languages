#lang racket

;;---------------------------------------------------------------------------------------------------------------
;; Program     : guessingGame.rkt
;; Professor   : Richard Riehle
;; Programmer  : Jigar Gosalia (89753)
;;               Shanshan Zhao (89125)
;; Description : Number Guessing Game let user define a target number to guess (using the pre-defined UPPERBOUND)
;;               and a definite number of attempts.
;;               This also provides expert level to the user depending upon the no. of attempts
;;               user took to guess the number.
;; Usage       : (game upperbound tries)
;;                   where upperbound = Upperbound of the guessing number.
;;                         tries      = Total no. of attempts.
;;---------------------------------------------------------------------------------------------------------------

;;----------------------------
;; Start Number Guessing Game.
;;----------------------------
(define (game upperbound tries)

;;------------------
;; Define Constants.
;;------------------
(define guess (random upperbound))

;;------------------
;; Display Messages.
;;------------------
(define (message difference)
  (cond [(< difference 0) "Too low, try again!"]
        [(> difference 0) "Too high, try again!"]
        [else        "Bingo!, You won!!"]))

;;---------------------------------------------------------------------------
;; Display Expert Level depending on no. of attempts it took to guess number.
;; <= 25% of tries         = You are Genius
;; > 25% & <= 50% of tries = You are Rockstar
;; > 50% & <= 75% of tries = You are Average
;; > 75% of tries          = You could do better
;;---------------------------------------------------------------------------
(define (expert attempts)
  (let ([level (floor (* (/ (+ (- tries attempts) 1) tries) 100))])
    (cond [(<= level 25) (string-append "You guessed the number in " (~a (+ (- tries attempts) 1)) " attempts, You are Genius!")]
        [(and (> level 25) (<= level 50)) (string-append "You guessed the number in " (~a (+ (- tries attempts) 1)) " attempts, You are Rockstar!")]
        [(and (> level 50) (<= level 75)) (string-append "You guessed the number in " (~a (+ (- tries attempts) 1)) " attempts, You are Average!")]
        [else        (string-append "You guessed the number in " (~a (+ (- tries attempts) 1)) " attempts, You could do better!!")])))

;;--------------------------------------------------
;; Check if the given input is a number, if not then
;; iterate in loop to get a valid number from user.
;;--------------------------------------------------
(define (number guess)
  (define data null)
  (set! data (read))
  (let/ec break
    (let loop()
      (cond [(number? data)  (break)])
      (displayln "Not a valid number, please try again!")
      (displayln "")
      (set! data (read))
      (loop)))
  (let ([difference (- data guess)])
    (displayln (message difference))
    (zero? difference)))

;;--------------------------------
;; Recursive Number Guessing Game.
;;--------------------------------
(define (guessingGame guess attempts)
  (cond [(zero? attempts)      (displayln (string-append "You loose, You have exceeded maximum " (~a attempts) " attempts!!"))]
        [(number guess)        (expert attempts)]
        [else                  (guessingGame guess (- attempts 1))]))
  (displayln (string-append "Enter a guess between 0 and " (~a upperbound) " (You have " (~a tries) " attempts): " ))

(guessingGame guess tries))


