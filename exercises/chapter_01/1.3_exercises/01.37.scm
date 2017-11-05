;An infinite continued fraction is an expression of the form
;f=N1D1+N2D2+N3D3+⋯
;As an example, one can show that the infinite continued fraction expansion with
;the Ni and the Di all equal to 1 produces 1ϕ, where ϕ is the golden ratio (described in section 1.2.2).
;
;One way to approximate an infinite continued fraction is to truncate the
;expansion after a given number of terms. Such a truncation — a so-called
;k-term finite continued fraction — has the form
;f=N1D1+N2⋱+NkDk
;Suppose that n and d are procedures of one argument (the term index i that return
;the Ni and Di of the terms of the continued fraction.
;
;Define a procedure cont-frac such that evaluating (cont-frac n d k) computes the
;value of the k-term finite continued fraction.
;Check your procedure by approximating 1ϕ1ϕ using
;
;(cont-frac (lambda (i) 1.0)
;           (lambda (i) 1.0)
;           k)
;for successive values of k. How large must you make k in order to get an
;approximation that is accurate to 4 decimal places?
;
;B. If your cont-frac procedure generates a recursive process, write one that
;generates an iterative process. If it generates an iterative process, write
;one that generates a recursive process.

(define (cont-frac n d k)
  (define (recursive-frac i)
    (if (< i k)(/ (n i) (+ (d i) (recursive-frac(+ i 1))))
               (/ (n i) (d i))))
(recursive-frac 1))

; k = 12 gives us accuracy within 0.0001 of the expected 0.61803
(cont-frac (lambda (i) 1.0)
  (lambda (i) 1.0)
  12)
;.6180257510729613


(define (cont-frac-iterative n d k)
  (define (iterative-frac i acc)
    (if (= i 0) acc
               (iterative-frac (- i 1)(/ (n i)
                                         (+ (d i) acc)))))
(iterative-frac k (/ (n k)(d k))))

; k = 12 gives us accuracy within 0.0001 of the expected 0.61803
(cont-frac-iterative (lambda (i) 1.0)
  (lambda (i) 1.0)
  11)
;.6180371352785146
