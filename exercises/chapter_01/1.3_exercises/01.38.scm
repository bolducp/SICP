;In 1737, the Swiss mathematician Leonhard Euler published a memoir De
;Fractionibus Continuis, which included a continued fraction expansion for e−2,
;where e is the base of the natural logarithms. In this fraction, the Ni are all 1,
;and the Di are successively 1,2,1,1,4,1,1,6,1,1,8,… Write a program that uses your
;cont-frac procedure from exercise 1.37 to approximate e, based on Euler’s expansion.

(define (cont-frac d k)
  (define (recursive-frac i)
    (if (< i k) (/ 1.0 (+ (compute-d i) (recursive-frac(+ i 1))))
               (/ 1.0 (compute-d i))))
(recursive-frac 1))

(define (compute-d i)
  (if (= (remainder i 3) 2) (/ (+ i 1) 1.5)
                            1))

(define (euler-e k)
  (+ 2.0 (cont-frac compute-d k)))

(euler-e 10)
