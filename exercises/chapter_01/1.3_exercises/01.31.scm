;Exercise 1.31
;The sum procedure is only the simplest of a vast number of similar abstractions
;that can be captured as higher-order procedures.Write an analogous procedure
;called product that returns the product of the values of a function at points
;over a given range. Try both a recursive and an iterative approach.
;
;Show how to define factorial in terms of product. Also use product to compute
;approximations to using the formula: π/4 = (2⋅4⋅4⋅6⋅6⋅8...) / (3⋅3⋅5⋅5⋅7⋅7...)

(define (inc n) (+ n 1))

(define (identity x) x)

; recursive
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; iterative
 (define (product-iter term a next b)
   (define (iter a result)
     (if (> a b)
         result
         (iter (next a)(* (term a) result))))
   (iter (term a) 1))

; factorial

(define (factorial n)
  (product-iter identity 1 inc n))

; testing
(factorial 0)
(factorial 1)
(factorial 2)
(factorial 3)
(factorial 6)

; π/4 = (2⋅4⋅4⋅6⋅6⋅8...) / (3⋅3⋅5⋅5⋅7⋅7...)

(define (pi-product n)
  (define (term x)
     (if (even? x)
         (/ (+ x 2) (+ x 1))
         (/ (+ x 1) (+ x 2))))
  (product-iter term 1 inc n))

(pi-product 4)
