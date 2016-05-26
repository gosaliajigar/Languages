#lang slideshow
(require 2htdp/image)

;;---------------------------------------------------------------------------------------------------------------------------
;; Program     : morseCode.rkt
;; Professor   : Richard Riehle
;; Programmer  : Jigar Gosalia (89753)
;;               Shanshan Zhao (89125)
;; Description : Encodes given message to Morse Code and Decodes given morse code into a human readable
;;               message.
;;               - During encoding, if there is an unknown character then it wouldn't encode and display
;;                 the same character.
;;               - During decoding, if there is an unknown morse code combination word then it wouldn't
;;                 decode and display the morse code as it is.
;; Usage       : (encodeMorse) and start typing the message you would like to encode and get Morse Code Symbols.
;;               (encodeDataMorse) and start typing the message you would like to encode and get Morse Code(dots and dashes).
;;               (decodeMorse) and start typing the morse code you would like to decode.
;; Credits     : Please check attached morseCodeChart.gif for referring to morse codes.
;;---------------------------------------------------------------------------------------------------------------------------


;;--------------------------
; Define Morse Code symbols.
;;--------------------------
(define dot (circle 5 "solid" "black"))
(define dash (rectangle 20 10 "solid" "black"))

;;--------------------------------------
; Define Morse Code Symbols for NUMBERS.
;;--------------------------------------
(define ONE (hc-append 4 dot dash dash dash dash))
(define TWO (hc-append 4 dot dot dash dash dash))
(define THREE (hc-append 4 dot dot dot dash dash))
(define FOUR (hc-append 4 dot dot dot dot dash))
(define FIVE (hc-append 4 dot dot dot dot dot))
(define SIX (hc-append 4 dash dot dot dot dot))
(define SEVEN (hc-append 4 dash dash dot dot dot))
(define EIGHT (hc-append 4 dash dash dash dot dot))
(define NINE (hc-append 4 dash dash dash dash dot))
(define ZERO (hc-append 4 dash dash dash dash dash))

;;----------------------------------------
; Define Morse Code Symbols for ALPHABETS.
;;----------------------------------------
(define A (hc-append 4 dot dash))
(define B (hc-append 4 dash dot dot dot))
(define C (hc-append 4 dash dot dash dot))
(define D (hc-append 4 dash dot dot))
(define E (hc-append 4 dot))
(define F (hc-append 4 dot dot dash dot))
(define G (hc-append 4 dash dash dot))
(define H (hc-append 4 dot dot dot dot))
(define I (hc-append 4 dot dot))
(define J (hc-append 4 dot dash dash dash))
(define K (hc-append 4 dash dot dash))
(define L (hc-append 4 dot dash dot dot))
(define M (hc-append 4 dash dash))
(define N (hc-append 4 dash dot))
(define O (hc-append 4 dash dash dash))
(define P (hc-append 4 dot dash dash dot))
(define Q (hc-append 4 dash dash dot dash))
(define R (hc-append 4 dot dash dot))
(define S (hc-append 4 dot dot dot))
(define T (hc-append 4 dash))
(define U (hc-append 4 dot dot dash))
(define V (hc-append 4 dot dot dot dash))
(define W (hc-append 4 dot dash dash))
(define X (hc-append 4 dash dot dot dash))
(define Y (hc-append 4 dash dot dash dash))
(define Z (hc-append 4 dash dash dot dot))

;;-------------------------------------------
; Define Morse Code Symbols for PUNTUCATIONS.
;;-------------------------------------------
(define ESCAPE (hc-append 4 dash dash dash dash dot dot))
(define DIVIDE (hc-append 4 dot dot dot dot dash dash))
(define OSQBRAC (hc-append 4 dot dash dash dot dot dot))
(define CSQBRAC (hc-append 4 dash dot dot dash dash dash))
(define OANBRAC (hc-append 4 dash dash dot dot dash dash))
(define CANBRAC (hc-append 4 dot dot dash dash dot dot))
(define OBRAC (hc-append 4 dash dash dash dot dot dot))
(define CBRAC (hc-append 4 dot dot dot dash dash dash))
(define CCURBRAC (hc-append 4 dash dash dot dot dash))
(define OCURBRAC (hc-append 4 dot dot dash dash dot))
(define DOT (hc-append 4 dot dash dash dash dash dash))
(define COMMA (hc-append 4 dash dot dot dot dot dot))
(define UNDERSCORE (hc-append 4 dash dash dash dash dot dash))
(define PIPE (hc-append 4 dot dot dot dot dash dot))
(define QUESTION (hc-append 4 dash dot dash dash dash dash))
(define EXCLAMATION (hc-append 4 dot dash dot dot dot dot))
(define SEMICOLON (hc-append 4 dash dot dot dot dot dash))
(define COLON (hc-append 4 dot dash dash dash dash dot))
(define DASH (hc-append 4 dot dash dash dash dot))
(define DOLLAR (hc-append 4 dot dot dash dash dash dash))
(define PERCENT (hc-append 4 dot dot dot dash dot dash))
(define DQUOTES (hc-append 4 dot dot dot dash dash dot))
(define AT (hc-append 4 dash dash dash dot dot dash))
(define SQUOTES (hc-append 4 dot dot dash dot dot dot))
(define SPCOMMA (hc-append 4 dash dash dot dash dash dash))
(define CARROT (hc-append 4 dash dot dot dot dash dash))
(define TILDE (hc-append 4 dash dash dash dot dash dash))
(define HASH (hc-append 4 dot dot dash dash dash dot))
(define AMPERSAND (hc-append 4 dot dash dash dash dot dot))
(define PLUS (hc-append 4 dash dot dot dot dash))
(define EQUAL (hc-append 4 dash dash dash dot dash))
(define STAR (hc-append 4 dash dot dot dash dash))

;;-----------------------------------------------------------------
; Convert alphabet, number and punctuation into morse code symbols.
;;-----------------------------------------------------------------
(define (encode letter)
  (cond [(string-ci=? (~a letter) "1") (print ONE) (display "    ")]
        [(string-ci=? (~a letter) "2") (print TWO) (display "    ")]
        [(string-ci=? (~a letter) "3") (print THREE) (display "    ")]
        [(string-ci=? (~a letter) "4") (print FOUR) (display "    ")]
        [(string-ci=? (~a letter) "5") (print FIVE) (display "    ")]
        [(string-ci=? (~a letter) "6") (print SIX) (display "    ")]
        [(string-ci=? (~a letter) "7") (print SEVEN) (display "    ")]
        [(string-ci=? (~a letter) "8") (print EIGHT) (display "    ")]
        [(string-ci=? (~a letter) "9") (print NINE) (display "    ")]
        [(string-ci=? (~a letter) "0") (print ZERO) (display "    ")]
        [(string-ci=? (~a letter) "a") (print A) (display "    ")]
        [(string-ci=? (~a letter) "b") (print B) (display "    ")]
        [(string-ci=? (~a letter) "c") (print C) (display "    ")]
        [(string-ci=? (~a letter) "d") (print D) (display "    ")]
        [(string-ci=? (~a letter) "e") (print E) (display "    ")]
        [(string-ci=? (~a letter) "f") (print F) (display "    ")]
        [(string-ci=? (~a letter) "g") (print G) (display "    ")]
        [(string-ci=? (~a letter) "h") (print H) (display "    ")]
        [(string-ci=? (~a letter) "i") (print I) (display "    ")]
        [(string-ci=? (~a letter) "j") (print J) (display "    ")]
        [(string-ci=? (~a letter) "k") (print K) (display "    ")]
        [(string-ci=? (~a letter) "l") (print L) (display "    ")]
        [(string-ci=? (~a letter) "m") (print M) (display "    ")]
        [(string-ci=? (~a letter) "n") (print N) (display "    ")]
        [(string-ci=? (~a letter) "o") (print O) (display "    ")]
        [(string-ci=? (~a letter) "p") (print P) (display "    ")]
        [(string-ci=? (~a letter) "q") (print Q) (display "    ")]
        [(string-ci=? (~a letter) "r") (print R) (display "    ")]
        [(string-ci=? (~a letter) "s") (print S) (display "    ")]
        [(string-ci=? (~a letter) "t") (print T) (display "    ")]
        [(string-ci=? (~a letter) "u") (print U) (display "    ")]
        [(string-ci=? (~a letter) "v") (print V) (display "    ")]
        [(string-ci=? (~a letter) "w") (print W) (display "    ")]
        [(string-ci=? (~a letter) "x") (print X) (display "    ")]
        [(string-ci=? (~a letter) "y") (print Y) (display "    ")]
        [(string-ci=? (~a letter) "z") (print Z) (display "    ")]
        [(string=? (~a letter) "\\") (print ESCAPE) (display "    ")]
        [(string=? (~a letter) "/") (print DIVIDE) (display "    ")]
        [(string=? (~a letter) "[") (print OSQBRAC) (display "    ")]
        [(string=? (~a letter) "]") (print CSQBRAC) (display "    ")]
        [(string=? (~a letter) "<") (print OANBRAC) (display "    ")]
        [(string=? (~a letter) ">") (print CANBRAC) (display "    ")]
        [(string=? (~a letter) "(") (print OBRAC) (display "    ")]
        [(string=? (~a letter) ")") (print CBRAC) (display "    ")]
        [(string=? (~a letter) "}") (print CCURBRAC) (display "    ")]
        [(string=? (~a letter) "{") (print OCURBRAC) (display "    ")]
        [(string=? (~a letter) ".") (print DOT) (display "    ")]
        [(string=? (~a letter) ",") (print COMMA) (display "    ")]
        [(string=? (~a letter) "_") (print UNDERSCORE) (display "    ")]
        [(string=? (~a letter) "|") (print PIPE) (display "    ")]
        [(string=? (~a letter) "?") (print QUESTION) (display "    ")]
        [(string=? (~a letter) "!") (print EXCLAMATION) (display "    ")]
        [(string=? (~a letter) ";") (print SEMICOLON) (display "    ")]
        [(string=? (~a letter) ":") (print COLON) (display "    ")]
        [(string=? (~a letter) "-") (print DASH) (display "    ")]
        [(string=? (~a letter) "$") (print DOLLAR) (display "    ")]
        [(string=? (~a letter) "%") (print PERCENT) (display "    ")]
        [(string=? (~a letter) "\"") (print DQUOTES) (display "    ")]
        [(string=? (~a letter) "@") (print AT) (display "    ")]
        [(string=? (~a letter) "'") (print SQUOTES) (display "    ")]
        [(string=? (~a letter) "`") (print SPCOMMA) (display "    ")]
        [(string=? (~a letter) "^") (print CARROT) (display "    ")]
        [(string=? (~a letter) "~") (print TILDE) (display "    ")]
        [(string=? (~a letter) "#") (print HASH) (display "    ")]
        [(string=? (~a letter) "&") (print AMPERSAND) (display "    ")]
        [(string=? (~a letter) "+") (print PLUS) (display "    ")]
        [(string=? (~a letter) "=") (print EQUAL) (display "    ")]
        [(string=? (~a letter) "*") (print STAR) (display "    ")]
        [else (display letter)]))

;;--------------------------------------------------------------------------
; Convert alphabet, number and punctuation into morse code (dots and dashes.
;;--------------------------------------------------------------------------
(define (encodeData letter)
  (cond [(string=? (~a letter) "1") (display ".----")]
        [(string=? (~a letter) "2") (display "..---")]
        [(string=? (~a letter) "3") (display "...--")]
        [(string=? (~a letter) "4") (display "....-")]
        [(string=? (~a letter) "5") (display ".....")]
        [(string=? (~a letter) "6") (display "-....")]
        [(string=? (~a letter) "7") (display "--...")]
        [(string=? (~a letter) "8") (display "---..")]
        [(string=? (~a letter) "9") (display "----.")]
        [(string=? (~a letter) "0") (display "-----")]
        [(string-ci=? (~a letter) "a") (display ".-")]
        [(string-ci=? (~a letter) "b") (display "-...")]
        [(string-ci=? (~a letter) "c") (display "-.-.")]
        [(string-ci=? (~a letter) "d") (display "-..")]
        [(string-ci=? (~a letter) "e") (display ".")]
        [(string-ci=? (~a letter) "f") (display "..-.")]
        [(string-ci=? (~a letter) "g") (display "--.")]
        [(string-ci=? (~a letter) "h") (display "....")]
        [(string-ci=? (~a letter) "i") (display "..")]
        [(string-ci=? (~a letter) "j") (display ".---")]
        [(string-ci=? (~a letter) "k") (display "-.-.")]
        [(string-ci=? (~a letter) "l") (display ".-..")]
        [(string-ci=? (~a letter) "m") (display "--")]
        [(string-ci=? (~a letter) "n") (display "-.")]
        [(string-ci=? (~a letter) "o") (display "---")]
        [(string-ci=? (~a letter) "p") (display ".--.")]
        [(string-ci=? (~a letter) "q") (display "--.-")]
        [(string-ci=? (~a letter) "r") (display ".-.")]
        [(string-ci=? (~a letter) "s") (display "...")]
        [(string-ci=? (~a letter) "t") (display "-")]
        [(string-ci=? (~a letter) "u") (display "..-")]
        [(string-ci=? (~a letter) "v") (display "...-")]
        [(string-ci=? (~a letter) "w") (display ".--")]
        [(string-ci=? (~a letter) "x") (display "-..-")]
        [(string-ci=? (~a letter) "y") (display "-.--")]
        [(string-ci=? (~a letter) "z") (display "--..")]
        [(string=? (~a letter) "\\") (display "----..")]
        [(string=? (~a letter) "/") (display "....--")]
        [(string=? (~a letter) "[") (display ".--...")]
        [(string=? (~a letter) "]") (display "-..---")]
        [(string=? (~a letter) "<") (display "--..--")]
        [(string=? (~a letter) ">") (display "..--..")]
        [(string=? (~a letter) "(") (display "---...")]
        [(string=? (~a letter) ")") (display "...---")]
        [(string=? (~a letter) "}") (display "--..-")]
        [(string=? (~a letter) "{") (display "..--.")]
        [(string=? (~a letter) ".") (display ".-----")]
        [(string=? (~a letter) ",") (display "-.....")]
        [(string=? (~a letter) "_") (display "----.-")]
        [(string=? (~a letter) "|") (display "....-.")]
        [(string=? (~a letter) "?") (display "-.----")]
        [(string=? (~a letter) "!") (display ".-....")]
        [(string=? (~a letter) ";") (display "-....-")]
        [(string=? (~a letter) ":") (display ".----.")]
        [(string=? (~a letter) "-") (display ".---.")]
        [(string=? (~a letter) "$") (display "..----")]
        [(string=? (~a letter) "%") (display "...-.-")]
        [(string=? (~a letter) "\"") (display "...--.")]
        [(string=? (~a letter) "@") (display "---..-")]
        [(string=? (~a letter) "'") (display "..-...")]
        [(string=? (~a letter) "`") (display "--.---")]
        [(string=? (~a letter) "^") (display "-...--")]
        [(string=? (~a letter) "~") (display "---.--")]
        [(string=? (~a letter) "#") (display "..---.")]
        [(string=? (~a letter) "&") (display ".---..")]
        [(string=? (~a letter) "+") (display "-...-")]
        [(string=? (~a letter) "=") (display "---.-")]
        [(string=? (~a letter) "*") (display "-..--")]
        [else (display letter)]))

;;---------------------------------------------------------
; Convert morse code into alphabet, number or punctuation.
;;---------------------------------------------------------
(define (decode word)
  (cond [(string=? (~a word) ".----") (display "1")]
        [(string=? (~a word) "..---") (display "2")]
        [(string=? (~a word) "...--") (display "3")]
        [(string=? (~a word) "....-") (display "4")]
        [(string=? (~a word) ".....") (display "5")]
        [(string=? (~a word) "-....") (display "6")]
        [(string=? (~a word) "--...") (display "7")]
        [(string=? (~a word) "---..") (display "8")]
        [(string=? (~a word) "----.") (display "9")]
        [(string=? (~a word) "-----") (display "0")]
        [(string=? (~a word) ".-") (display "A")]
        [(string=? (~a word) "-...") (display "B")]
        [(string=? (~a word) "-.-.") (display "C")]
        [(string=? (~a word) "-..") (display "D")]
        [(string=? (~a word) ".") (display "E")]
        [(string=? (~a word) "..-.") (display "F")]
        [(string=? (~a word) "--.") (display "G")]
        [(string=? (~a word) "....") (display "H")]
        [(string=? (~a word) "..") (display "I")]
        [(string=? (~a word) ".---") (display "J")]
        [(string=? (~a word) "-.-.") (display "K")]
        [(string=? (~a word) ".-..") (display "L")]
        [(string=? (~a word) "--") (display "M")]
        [(string=? (~a word) "-.") (display "N")]
        [(string=? (~a word) "---") (display "O")]
        [(string=? (~a word) ".--.") (display "P")]
        [(string=? (~a word) "--.-") (display "Q")]
        [(string=? (~a word) ".-.") (display "R")]
        [(string=? (~a word) "...") (display "S")]
        [(string=? (~a word) "-") (display "T")]
        [(string=? (~a word) "..-") (display "U")]
        [(string=? (~a word) "...-") (display "V")]
        [(string=? (~a word) ".--") (display "W")]
        [(string=? (~a word) "-..-") (display "X")]
        [(string=? (~a word) "-.--") (display "Y")]
        [(string=? (~a word) "--..") (display "Z")]
        [(string=? (~a word) "----..") (display "\\")]
        [(string=? (~a word) "....--") (display "/")]
        [(string=? (~a word) ".--...") (display "[")]
        [(string=? (~a word) "-..---") (display "]")]
        [(string=? (~a word) "--..--") (display "<")]
        [(string=? (~a word) "..--..") (display ">")]
        [(string=? (~a word) "---...") (display "(")]
        [(string=? (~a word) "...---") (display ")")]
        [(string=? (~a word) "--..-") (display "}")]
        [(string=? (~a word) "..--.") (display "{")]
        [(string=? (~a word) ".-----") (display ".")]
        [(string=? (~a word) "-.....") (display ",")]
        [(string=? (~a word) "----.-") (display "_")]
        [(string=? (~a word) "....-.") (display "|")]
        [(string=? (~a word) "-.----") (display "?")]
        [(string=? (~a word) ".-....") (display "!")]
        [(string=? (~a word) "-....-") (display ";")]
        [(string=? (~a word) ".----.") (display ":")]
        [(string=? (~a word) ".---.") (display "-")]
        [(string=? (~a word) "..----") (display "$")]
        [(string=? (~a word) "...-.-") (display "%")]
        [(string=? (~a word) "...--.") (display "\"")]
        [(string=? (~a word) "---..-") (display "@")]
        [(string=? (~a word) "..-...") (display "'")]
        [(string=? (~a word) "--.---") (display "`")]
        [(string=? (~a word) "-...--") (display "^")]
        [(string=? (~a word) "---.--") (display "~")]
        [(string=? (~a word) "..---.") (display "#")]
        [(string=? (~a word) ".---..") (display "&")]
        [(string=? (~a word) "-...-") (display "+")]
        [(string=? (~a word) "---.-") (display "=")]
        [(string=? (~a word) "-..--") (display "*")]
        [else (display word)]))

;;---------------------------------------
; Start Encoding into Morse Code Symbols.
;;---------------------------------------
(define (encodeMorse)
  (let/ec break
    (let loop()
      (displayln "Enter a line to get its morse code or Enter \"exit\" to quit): ")
      (define data (read-line))
      (cond [(string=? data "exit")  (break)])
      (for ([letter data])
        (encode letter))
      (displayln "")
      (displayln "")
      (loop))))

;;-------------------------------------------------
; Start Encoding into Morse Code (dots and dashes).
;;-------------------------------------------------
(define (encodeDataMorse)
  (let/ec break
    (let loop()
      (displayln "Enter a line to get its morse code or Enter \"exit\" to quit): ")
      (define data (read-line))
      (cond [(string=? data "exit")  (break)])
      (for ([letter data])
        (encodeData letter)
        (display " "))
      (displayln "")
      (displayln "")
      (loop))))

;;--------------------------------
; Start Decoding from Morse Code.
;;--------------------------------
(define (decodeMorse)
  (let/ec break
    (let loop()
      (displayln "Enter a morse code to decode or Enter \"exit\" to quit): ")
      (define data (read-line))
      (cond [(string=? data "exit")  (break)])
      (for ([word (string-split data " ")])
        (decode word))
        (display " ")
      (displayln "")
      (displayln "")
      (loop))))
