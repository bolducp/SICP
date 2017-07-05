;Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime?
;(the Fermat method), and test each of the 12 primes you found in that exercise.
;Since the Fermat test has Θ(logn) growth, how would you expect the time to
;test primes near 1,000,000 to compare with the time needed to test primes
;near 1000? Do your data bear this out? Can you explain any discrepancy you find?

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
      (else false)))

(define (square x) (* x x))

(define (timed-prime-test n)
 (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
 (if (fast-prime? n 100)
     (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
 (newline)
 (display n)
 (display " *** ")
 (display elapsed-time))

(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 100000000003)
(timed-prime-test 100000000019)
(timed-prime-test 100000000057)
(timed-prime-test 100000000000051)
(timed-prime-test 100000000000099)
(timed-prime-test 10000000000000000099)
(timed-prime-test 100000000000000000099)

; Since the Fermat test has Θ(logn) growth, I'd expect to find that primes near 1,000,000 take about
; twice as long as primes near 1,000. However, the interpreter is so fast, that this difference doesn't
; actually seem to be reflected in the timed-prime-test results.
