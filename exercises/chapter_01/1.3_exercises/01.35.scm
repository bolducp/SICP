;Show that the golden ratio (section 1.2.2) is a fixed point of the
;transformation x↦1+1/x, and use this fact to compute ϕ by means of
;the fixed-point procedure.

;x = 1 + 1/x
;x^2 = x + 1
;Turn this into a quadratic equation: x^2 - x - 1 = 0
;And use quadratic equation factorization to get the roots:
;x = 1/2(1 - √5)
;x = 1/2(1 + √5)
;which shows what the golden ratio we learned in 1.2.2 (ϕ = (1 + √5) / 2 = 1.618033988)
;is a fixed point of the transformation x = 1 + 1/x.
;
;We use the fixed-point function that SICP provides for us,
;and plug in the function that we're trying to find a fixed point for x = 1 + 1/x,
;which we can turn into the anonymous Scheme function (lambda (x) (+ 1 (/ 1 x))),
;and we can choose any starting value.
;
;Thus: (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
;= 1.6180327868852458

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
