;Alyssa P. Hacker doesn’t see why if needs to be provided as a special form.
;“Why can’t I just define it as an ordinary procedure in terms of cond?” she asks.
;Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:
;
;(define (new-if predicate then-clause else-clause)
;  (cond (predicate then-clause)
;        (else else-clause)))
;Eva demonstrates the program for Alyssa:
;
;(new-if (= 2 3) 0 5)
;5
;
;(new-if (= 1 1) 0 5)
;0
;Delighted, Alyssa uses new-if to rewrite the square-root program:
;
;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x) x)))
;What happens when Alyssa attempts to use this to compute square roots? Explain.


(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; -----------------------------------------------------
;
;I had some trouble with this question at first, because I was missing what the
;question was really trying to ask. I thought that the comparison under discussion
;was using "cond" as opposed to "if", and this does, in fact, work:
;
;(define (sqrt x)
;  (sqrt-iter 1.0 x))
;
;(define (sqrt-iter guess x)
;  (cond ((good-enough? guess x) guess)
;      (else (sqrt-iter (improve guess x)
;                 x))))
;
;(define (improve guess x)
;  (average guess (/ x guess)))
;
;(define (average x y)
;  (/ (+ x y) 2))
;
;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.001))
;
;This code above, which replaces the "if" statement with the "cond" statement
;in `sqrt-iter` works.
;
;However, the question is actually asking about what happens when you replace the
;if-statement with a custom designed function, which fails because since Scheme is
;an applicative-order language, it evaluates all of the arguments as soon as a
;function is called. Since `new-if` is a procedure, all of its subexpressions get
;evaluated as soon as it is applied, before it acts upon the operands provided.
;This includes a call to `sqrt-izer`, which then recursively calls `new-if`,
;and creates an infinite loop.
