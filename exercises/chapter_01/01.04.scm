;; Exercise 1.4.  Observe that our model of evaluation allows for combinations 
;; whose operators are compound expressions.
;; Use this observation to describe the behavior of the following procedure:

;; (define (a-plus-abs-b a b)
;;  ((if (> b 0) + -) a b))

;; The if-statement returns either the primitive procedure - or the primitive procedure +,
;; depending on whether b is greater than 0. This procedure is then applied to the operands
;; a and b.




