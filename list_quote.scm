;;; list-quote macro:  recursion in macro expansion
;;; (list-quote (+ 3 4) a b) is (list '(+ 3 4) 'a 'b)

(define-syntax list-quote
  (syntax-rules ( )
    ((_ ) '())
    ((_ a . rest)(cons 'a (list-quote . rest)))))

(list-quote (+ 3 4) a b)

;;; another way to define the same macro, using ...
(define-syntax list-quote2
  (syntax-rules ( )
    ((_ a ...) (list 'a ...))))

(list-quote2 (+ 3 4) a b)

(define-syntax demo-ellipse1
  (syntax-rules ( )
    ((_ a b ...) (list '(a b)...))))

(define-syntax demo-ellipse2
  (syntax-rules ( )
    ((_ a b ... c) (list '(a b)... '(lastly c)))))

(demo-ellipse1 (fog rain) joe sam sue)

(demo-ellipse2 (fog rain) joe sam sue)

