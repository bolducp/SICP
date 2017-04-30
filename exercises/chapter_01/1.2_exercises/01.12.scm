;Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.
;If a number lies outside of the triangle, return 0 (this makes sense if we view
;pascal as the combination function ). Start counting rows and columns from 0.

(define (pascal row col)
  (cond ((= row 1) 1)
        ((= col 1) 1)
        ((= row col) 1)
        (else (+ (pascal (- row 1) col)
                  (pascal row (- col 1))))
))


;(pascal-triangle 1 1) = 1
;(pascal-triangle 2 2) = 1
;(pascal-triangle 3 2) = 2
;(pascal-triangle 4 2) = 3
;(pascal-triangle 5 2) = 4
;(pascal-triangle 5 3) = 6
