;;; (quad a b c) returns a list of two roots of ax^2+bx+c=0
(define (quad a b c)
    (let ((discr (- (* b b)(* 4 a c)))
          (twoa (* 2 a)))
      (list (/ (- (- b)(sqrt discr))
               twoa)
            (/ (+ (- b)(sqrt discr))
               twoa))))

;;; multiplies (ax*x + ca)*(bx*x + cb), returns list of 3 coefficients of result,
;;; x^2 coefficient first
(define (poly-mult xa ca xb cb)
  (list (* xa xb)(+ (* xa cb)(* xb ca)) (* ca cb)))

;;; Returns value of ax^2+bx+c
(define (poly-eval x a b c)
  (+ (* a x x)(* b x) c))

;;; tests quad function, should return (0 0)
(define (test-quad xa ca xb cb)
  (let* ((coefs (poly-mult xa ca xb cb))
         (roots (apply quad coefs)))
    (map (lambda (x) (apply poly-eval (cons x coefs)))
         roots)))
