;;; deriv-rules is the data base in which to look up rules.  An a-list.
(define deriv-rules '( ))

;;; add the rule "if car is operator, call fn on cdr"
(define (add-rule operator fn)
  (set! deriv-rules  (cons (list operator fn) deriv-rules)))

;;; look up the rule for "car is operator"
(define (lookup-rule operator)
  (car (cdr (assoc operator deriv-rules))))

;;; compute the derivative of expr with respect to x
(define (deriv expr)
  (cond ((number? expr) 0)
	((eq? expr 'x) 1)
	((symbol? expr) 0)
	((list? expr)
	 ((lookup-rule (car expr))
	  (cdr expr)))))
	 
;;; define and add rule for +
(define (+rule args)
  (list '+	
	(deriv (car args))
	(deriv (car (cdr args)))))

(add-rule '+ +rule)

;;; define and add rule for *
(define (*rule args)
  (list '+
	(list '*
	      (car args)
	      (deriv (car (cdr args))))
	(list '*
	      (deriv (car args))
	      (car (cdr args)))))

(add-rule '* *rule)