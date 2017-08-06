;The sum procedure above generates a linear recursion.
;The procedure can be rewritten so that the sum is performed
;iteratively. Show how to do this by filling in the missing
;expressions in the following definition:
;
;
;(define (sum term a next b)
;  (define (iter a result)
;    (if <??>
;        <??>
;        (iter <??> <??>)))
;  (iter <??> <??>))

(define (sum-recursive term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-recursive term (next a) next b))))


(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)(+ (term a) result))))
  (iter (term a) 0))


; testing:

(define (inc n) (+ n 1))

(define (identity x) x)

(define (sum-integers a b)
  (sum-iter identity a inc b))

(sum-integers 1 10) ; 55
