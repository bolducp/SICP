;Exercise 1.9. Each of the following two procedures defines a method for
; adding two positive integers in terms of the procedures inc, which
; increments its argument by 1, and dec, which decrements its argument by 1.

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(+ 4 5)
(if (= 4 0)
    5
    (inc (+ (dec 4) 5))))

= (if (= 4 0)
      5
      (inc (+ (3) 5))))

(if (= 4 0)
    5
    (inc (+ (3) 5))))
          = (if (= 3 0)
                5
                (inc (+ (dec 3) 5))))
                = (if (= 3 0)
                      5
                      (inc (+ (2) 5))))
                            = (if (= 2 0)
                                  5
                                  (inc (+ (1) 5))))
                                        = (if (= 1 0)
                                            5
                                            (inc (+ (0) 5))))
                                                  = (if (= 0 0)
                                                      5
                                                      (inc (+ (-1) 5))))
                                                      5

                                  (inc (+ (1) 5))))
                                        = (if (= 1 0)
                                            5
                                            (inc 5)
                                             = 6
                     (inc (+ (2) 5))))
                           = (if (= 2 0)
                                 5
                                 (inc 6)
                                 = 7
                                 = 6
               (inc (+ (3) 5))))
                     = (if (= 3 0)
                           5
                           (inc 7)
                           = 8
   (if (= 4 0)
       5
       (inc 8)
       = 9
= 9

; Procedure #2

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

(+ 4 5)
(if (= 4 0)
    5
    (+ (dec 4) (inc 5))))
    = (+ 3 6)
      (if (= 3 0)
          6
          (+ (dec 3) (inc 6))))
          = (+ 2 7)
            (if (= 2 0)
                7
                (+ (dec 2) (inc 7))))
                = (+ 1 8)
                (if (= 3 0)
                    6
                    (+ (dec 1) (inc 8))))
                    (+ 0 9)
                    (if (= 0 0)
                        9
                        (+ (dec 0) (inc 9))))
                      = 9
= 9

;; The first procedure is recursive. It requires you to keep track of which layer
;; you are on in the cycles of recursive calls in order to pass the results back up
;; to the initial invocation. The second procedure, however, returns as soon as it
;; meets its correct condition, and does not require the lower recursive calls to
;; know anything about, or pass results back up to, the prior calls.
