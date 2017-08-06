;Exercise 1.29. Simpson's Rule is a more accurate method of numerical integration
;than the method illustrated above. Using Simpson's Rule, the integral of a
;function f between a and b is approximated as
;h/3[y0+4y1+2y2+4y3+2y4+...+2yn−2+4yn−1+yn]
;where h=(b−a)/n, for some even integer n, and yk=f(a+kh).
;(Increasing n increases the accuracy of the approximation.)
;
;Define a procedure that takes as arguments f, a, b, and n and returns the value
;of the integral, computed using Simpson's Rule. Use your procedure to integrate
;cube between 0 and 1 (with n = 100 and n = 1000), and compare the results to
;those of the integral procedure shown above.

(define (cube x) (* x x x))

(define (inc n) (+ n 1))

(define (even? n)
  (= (remainder n 2) 0))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))


(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (yk k)
    (f (+ (* k h) a)))
  (define (term x)
    (* (cond ((= x 0) 1)
             ((= x n) 1)
             ((even? x) 2)
             (else 4))
       (yk x)))
  (* (/ h 3)(sum term 0 inc n)))


(simpson cube 0 1 100.0)  ; .24999999999999992
(integral cube 0 1 0.01)  ; .24998750000000042

(simpson cube 0 1 1000.0)  ; .2500000000000003
(integral cube 0 1 0.001) ; .249999875000001
