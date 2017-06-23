;The smallest-divisor procedure shown at the start of this section does lots of
;needless testing: After it checks to see if the number is divisible by 2 there
;is no point in checking to see if it is divisible by any larger even numbers.
;This suggests that the values used for test-divisor should not be 2,3,4,5,6,…
;but rather 2,3,5,7,9,…To implement this change, define a procedure next that
;returns 3 if its input is equal to 2 and otherwise returns its input plus 2.
;
;Modify the smallest-divisor procedure to use (next test-divisor) instead of
;(+ test-divisor 1). With timed-prime-test incorporating this modified version
;of smallest-divisor, run the test for each of the 12 primes found in
;exercise 1.22. Since this modification halves the number of test steps,
;you should expect it to run about twice as fast. Is this expectation confirmed?
;If not, what is the observed ratio of the speeds of the two algorithms,
;and how do you explain the fact that it is different from 2?

(define (square x) (* x x))

(define (smallest-divisor n)
 (find-divisor n 2))

(define (divides? a b)
 (= (remainder b a) 0))

(define (prime? n)
 (= n (smallest-divisor n)))

(define (timed-prime-test n)
 (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
 (if (prime? n)
     (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
 (newline)
 (display n)
 (display " *** ")
 (display elapsed-time))

(define (search-for-primes-num-primes minimum num-primes)
   (cond ((= num-primes 0) (display "done"))
         ((prime? minimum)
           (begin
             (display minimum)
             (timed-prime-test minimum)
             (search-for-primes-num-primes (+ minimum 2) (- num-primes 1))))
         ((even? minimum) (search-for-primes-num-primes (+ minimum 1) num-primes))
         (else (search-for-primes-num-primes (+ minimum 2) num-primes))))

;; new/adjusted code below

(define (next num)
  (if (= 2 num) 3 (+ num 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

        (display newline)
        (search-for-primes-num-primes 10000000000000 3)

;(search-for-primes-num-primes 100 3)
;(display newline)
;(search-for-primes-num-primes 1000000 3)
;(display newline)
;(search-for-primes-num-primes 100000000000 3)
;(display newline)
;(search-for-primes-num-primes 10000000000000 3)
;

;100000000003 *** .3299999999999983100000000019 vs. .20000000000000284100000000019 (1.649999999999968 times faster)
;100000000019 *** .3400000000000034100000000057 vs. .20000000000000284100000000057 (1.6999999999999929 )
;100000000057 *** .3399999999999892 vs. .20000000000000284 (1.6999999999999218 times faster)
;10000000000037 *** 3.28000000000000110000000000051 vs. 1.98000000000000410000000000051  (1.6565656565656537 times faster)
;10000000000051 *** 3.25999999999999110000000000099 vs. 1.969999999999998910000000000099 (1.654822335025377 times faster)
;10000000000099 *** 3.280000000000001 vs. 1.9799999999999898 (1.6565656565656657 times faster)
;10000000000099 *** 3.1000000000000014 vs. 2.030000000000001 (1.5270935960591132 times faster)
; We're seeing around a 1.5 times speed increase, as opposed to 2 times with the new next procedure.
; This might be in part accounted for by the fact that the new next check still adds one additional if-statement line of computation.
