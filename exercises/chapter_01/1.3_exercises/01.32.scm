;Show that sum and product (exercise 1.31) are both special cases of a still more
;general notion called accumulate that combines a collection of terms, using some
;general accumulation function:
;(accumulate combiner null-value term a next b)
;
;Accumulate takes as arguments the same term and range specifications as sum and
;product, together with a combiner procedure (of two arguments) that specifies
;how the current term is to be combined with the accumulation of the preceding
;terms and a null-value that specifies what base value to use when the terms
;run out. Write accumulate and show how sum and product can both be defined as
;simple calls to accumulate. Write two procedures, one that generates a recursive
;process and one iterative.


(define (inc n) (+ n 1))

(define (identity x) x)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)(combiner (term a) result))))
  (iter (term a) null-value))


(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate-iter + 0 term a next b))

; testing
(sum identity 1 inc 10) ; 55
(product identity 1 inc 6) ; 720
