(define fact
  (lambda (n)
    (if (= n 0)
        '()
        (* n (fact (- n 1))))))

(define sumsq
  (lambda (n)
    (if (= n 0)
        0
        (+ (* n n)
           (sumsq (- n 1))))))