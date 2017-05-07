;Using the results of exercises 1.16 and 1.17, devise a procedure that generates
;an iterative process for multiplying two integers in terms of adding, doubling,
;and halving and uses a logarithmic number of steps.


(define (even? n)
  (= (remainder n 2) 0))

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (square n) (* n n) )

(define (fast-iterative-mult a b)
  (define (mult-iter acc a b)
    (cond ((= b 0) acc)
          ((even? b) (mult-iter acc (double a) (halve b)))
          (else (mult-iter (+ acc a) a (- b 1)))))

(mult-iter 0 a b))


(fast-iterative-mult 2 6)
