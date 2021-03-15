;;; define unless macro, inspired by perl
;;;   (unless b x y) is (if b y x)
(define-syntax unless
  (syntax-rules ( )
    ((_ condition false-branch true-branch)
     (if condition true-branch false-branch ) )))

;;; use unless
(define (safe-inverse x)
  (unless (= x 0)
    (/ 1 x)
    '*infinity*))


;;; print x then space or newline
;;; (used by trace and tracem - see below)
(define (disp-sp x)
  (display x)
  (display " "))

(define (disp-nl x)
  (display x)
  (newline))
  
;;; a trace macro for instrumenting code.
;;; (trace label expr1 ... val) evals the exprs, then val
;;; prints label and values of exprs and val, 
;;; returns value of val.
;;; (trace expr) is similar but no label
(define-syntax trace
  (syntax-rules ( )
    ((_ label expr)
     (let ((val expr))
       (disp-sp 'label)
       (disp-nl val)
       val))
    ((_ expr)
     (let ((val expr))
       (disp-nl val)
       val))))

;;; use trace
(define (fact n)
  (trace f (if (= n 0) 1
               (* n (fact (- n 1))))))

(define (fact2 n)
  (trace (if (= n 0) 1
              (* n (fact2 (- n 1))))))

(fact 3)
(fact2 3)

(define-syntax tracem
  (syntax-rules ( )
    ((_ expr ... val)
     (let ((result val))
       (disp-sp expr) ...
       (disp-nl result)
       result))))

(define (factm n)
  (tracem "arg" n "val"
          (if (= n 0) 1
              (* n (factm (- n 1))))))

(factm 3)