;; Exercise 1.5.  
;; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using
;;  applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

;; (define (p) (p))

;; (define (test x y)
;;   (if (= x 0)
;;       0
;;       y))

;; Then he evaluates the expression

;; (test 0 (p))

;; What behavior will Ben observe with an interpreter that uses applicative-order evaluation?
;;  What behavior will he observe with an interpreter that uses normal-order evaluation? 
;; Explain your answer. (Assume that the evaluation rule for the special form if is the same 
;; whether the interpreter is using normal or applicative order: The predicate expression is 
;; evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)

;; With applicative-order, the expression will try to evaluate all of the operands so that the procedure is 
;; fully expanded before it is reduced. Thus, it will try to evaluate p, which just calls itself in a recursive loop,
;; and test will never end up getting invokved.

;; With normal order, p will never be evaluated (and thus will never have the chance to enter into its infinite loop),
;; because the first condition of the if-statement in test (x = 0) evaluates to true and the procedure returns 0 without
;; calling p.

