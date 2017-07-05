;Demonstrate that the Carmichael numbers listed in footnote 47 really
;do fool the Fermat test. That is, write a procedure that takes an
;integer n and tests whether a^n is congruent to a modulo n for
;every a<n, and try your procedure on the given Carmichael numbers.

(define (expmod base exp m)
 (cond ((= exp 0) 1)
       ((even? exp)
        (remainder (square (expmod base (/ exp 2) m))
                   m))
       (else
        (remainder (* base (expmod base (- exp 1) m))
                   m))))
(define (square x) (* x x))
(define (fermat-test n)
 (define (fermat-iter count n)
   (if (< count n)
     (if (= (expmod count n n) count) (fermat-iter (+ count 1) n) false)
     true))
  (fermat-iter 1 n))

(fermat-test 561)  ; Carmichael
(fermat-test 1105) ; Carmichael
(fermat-test 1729) ; Carmichael
(fermat-test 2465) ; Carmichael
(fermat-test 2821) ; Carmichael
(fermat-test 6601) ; Carmichael
; The Fermat test for the Carmichael numbers returns true, although it should be false
