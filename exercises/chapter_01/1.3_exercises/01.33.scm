;You can obtain an even more general version of accumulate (Exercise 1.32) by
;introducing the notion of a filter on the terms to be combined. That is, combine
;only those terms derived from values in the range that satisfy a specified
;condition. The resulting filtered-accumulate abstraction takes the same arguments
;as accumulate, together with an additional predicate of one argument that
;specifies the filter. Write filtered-accumulate as a procedure.


(define (filtered-accumulate combiner null-value term a next b filter?)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter? a) (iter (next a)(combiner (term a) result)))
          (else (iter (next a) result))))
  (iter a null-value))

;Show how to express the following using filtered-accumulate:
;1. the sum of the squares of the prime numbers in the interval a to b (assuming
;that you have a prime? predicate already written)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (inc n) (+ n 1))
(define (square n) (* n n))

(define (sum-prime-squares a b)
  (filtered-accumulate + 0 square a inc b prime?))

; testing
(sum-of-prime-squares 1 4) ;14
(sum-of-prime-squares 3 50) ;10462

;Show how to express the following using filtered-accumulate:
;2. the product of all the positive integers less than n that are relatively
;prime to n (i.e., all positive integers i<n such that GCD(i,n)=1GCD.

(define (identity x) x)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (relative-prime? x y)
  (= (gcd x y) 1))

(define (product-relatively-primes n)
  (define (filter-relative-prime x)
    (relative-prime? x n))
  (filtered-accumulate * 1 identity 1 inc n filter-relative-prime))

; testing
(product-relatively-primes 20) ; 8729721
