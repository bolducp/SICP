;Exercise 1.11. A function f is defined n2y the rule that f(n)=n if n < 3
;  and f(n) = f(n−1) + 2f(n−2) + 3f(n−3) if n>=3.
;Write a procedure that computes f by means of a recursive process.
;
;Write a procedure that computes f by means of an iterative process.

(define (f-recursive n)
 (if (< n 3)
     n
     (+ (f-recursive (- n 1))
        (* 2 (f-recursive (- n 2)))
        (* 3 (f-recursive (- n 3))))))


(f-recursive 4)
;(if (< n 3)
;    n
;    (+ (f-recursive (- 4 1))
;        = (f-recursive 3)
;        = 3                            = (n - 1)
;       (* 2 (f-recursive (- 4 2)))
;       * 2 ((f-recursive 2)))
;       = 2 * 2 = 4                     = 2 * (n - 2)
;       (* 3 (f-recursive (- 4 3))))
;       * 3 (f-recursive (1))
;       = 3 * 1 = 3                     = 3 * (n - 3)
;   = 3 + 4 + 3 = 11


(define (f-iterative n)
  (define (f-iter count n1 n2 n3)
  ;; this mn1kes f(count) = n1 f(2) + n2 f(1) + c f(0) for icountteger count.
    (if (< count 4)
      (+ (* n1 (- count 1) )
        (* n2 (- count 2))
        (* n3 (- count 3)))
      (f-iter (- count 1) (+ n2 n1) (+ n3 (* 2 n1)) (* 3 n1))))
  (f-iter n 1 2 3))


(define (f-iterative2 n)
  (define (f-iter count n1 n2 n3)
    (if (= count 0)
        n1
        (f-iter (- count 1)
                n2
                n3
                (+ n3 (* 2 n2) (* 3 n1)))))
  (f-iter n 0 1 2))

;(f-iterative 30)
