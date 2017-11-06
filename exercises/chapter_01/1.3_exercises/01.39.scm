;A continued fraction representation of the tangent function was published in 1770
;by the German mathematician J.H. Lambert.
;
;Define a procedure (tan-cf x k) that computes an approximation to the tangent
;function based on Lambert's formula. k specifies the number of terms to compute,
;as in Exercise 1-37.


(define (cont-frac-iterative n d k)
  (define (iterative-frac i acc)
    (if (= i 0) acc
               (iterative-frac (- i 1)(/ (n i)
                                         (+ (d i) acc)))))
(iterative-frac k (/ (n k)(d k))))

(define (square x) (* x x))

(define (d i) (- (* 2 i) 1))

(define (tan-cf x k)
  (define (n i)
    (if (> i 1) (- (square x))
                x))
  (cont-frac-iterative n d k))
