;There is a clever algorithm for computing the Fibonacci numbers in a logarithmic
;number of steps. Recall the transformation of the state variables aa and bb in
;the fib-iterprocess of 1.2.2: a←a+band b←ab←a. Call this transformation T, and
;observe that applying T over and over again n times, starting with 1 and 0,
;produces the pair Fib(n+1) and Fib(n). In other words, the Fibonacci numbers are
;produced by applying TnTn, the nth power of the transformation T, starting with
;the pair (1, 0). Now consider T to be the special case of p=0 and q=1 in a
;family of transformations Tpq, where Tpq transforms the pair (a,b) according
;to a←bq+aq+ap and b←bp+aq. Show that if we apply such a transformation Tpq
;twice, the effect is the same as using a single transformation Tp′q′ of the
;same form, and compute p′ and q′ in terms of p and q. 
;
;This gives us an explicit way to square these transformations, and thus we can
;compute TnTn using successive squaring, as in the fast-expt procedure. Put this
;all together to complete the following procedure, which runs in a logarithmic
;number of steps.

;1.) a ← bq + aq + ap = a(p + q) + bq
;    b ← bp + aq
;2.) a ← bq + (a(p + q) + bq)q + (a(p + q) + bq)p
;    =  a ← a(p^2 + 2pq + 2q^2) + b(2pq + q^2)
;    b ← (bp + aq)p + aq = bp^2 + ap^2 + aq
;    = (2pq + q^2)a + (p^2 + q^2)b
;p' = p^2 + q^2
;q' = 2pq + q^2


(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0)
         b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else
         (fib-iter (+ (* b q)(* a q)(* a p))
                   (+ (* b p)(* a q))
                   p
                   q
                   (- count 1)))))

(fib 9)
