;;; null-safe is a higher-order function that both takes a 
;;; function as its argument and returns a function as its
;;; result.
;;; (null-safe fn) takes as its argument fn, a function of one
;;; argument.  ((null-safe fn) arg) returns what (fn arg)
;;; returns, unless arg is ( ).  ((null-safe fn) '( ))
;;; returns ( ) and does not call fn.

(define (null-safe fn)
  (display "nullsafe")
  (lambda (x)
    (display (list "x is " x))
    (if (null? x)
        '( )
        (fn x))))

;;; nscdr is like cdr except that (nscdr '( )) returns
;;; ( ) instead of causing an error
(define nscdr (null-safe cdr))

;;; nscar is like car except that (nscar '( )) returns
;;; ( ) instead of causing an error
(define nscar (null-safe car))

;;; Consider the following two defintions:
(define nscadr1 (lambda (x) (nscar (nscdr x))))

(define nscadr2 (null-safe cadr))

(nscadr1 '( ))
(nscadr2 '( ))
(nscadr1 '(a))
;(nscadr2 '(a))  ;; why does this cause an error?