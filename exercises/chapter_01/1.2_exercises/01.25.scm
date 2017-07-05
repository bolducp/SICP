;Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod.
;After all, she says, since we already know how to compute exponentials, we could have simply written
;
;(define (expmod base exp m)
;  (remainder (fast-expt base exp) m))
;Is she correct? Would this procedure serve as well for our fast prime tester? Explain.

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (new-expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (new-expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (new-expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
      (else false)))

(define (square m)(* m m))

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


; Using the original version of expmod that calls fast-exp does seem to work; however,
; it takes so much time that attempting to do timed-prime-test runs for numbers over 1019
; seem to run indefinitely. Because the original expmod only calls the remainder function once the
; exponent has finished recursively multiplying through the fast-expt function, the return values
; within fast-expt grow massively large and computationally intensive. The new expmod, however,
; keeps the value being squared equal to or less than the possible prime number being tested.
