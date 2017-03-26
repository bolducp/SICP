;; Exercise 1.3. 
;; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sum-two-largest-squares x y z) 
  (if (> x y) 
    (if (> y z) (sum-of-squares x y) (sum-of-squares x z))
  (if (> x z) (sum-of-squares x y) (sum-of-squares y z))))


;; test
(= 34 (sum-two-largest-squares 3 2 5))

