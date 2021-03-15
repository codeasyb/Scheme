(define (square x) (* x x))

(define (one-more fn)
  (lambda (x)
    (+ (fn x) 1)))

(define sq+1 (one-more square))

(define (sq-all lst)
  (map square lst))

(define add-1 (lambda (x)(+ x 1))) ; this long form of define is used here
                                   ; to make the equivalence of add-1-all-a
                                   ; add-1-all-b clear
                                   ; add-1 is just a variable like x and *.
                                   ; Like * its value happens to be a function
                                   ;   rather than a number or a list
(define sq+1 (one-more square))

(define (add-1-all-a lst)
  (map
   add-1
   lst))

(define (add-1-all-b lst)
  (map
   (lambda (x) (+ 1 x))
   lst))

(define (add-n-all n lst)
  (map (lambda (x) (+ n x))  ; This n is within the scope of the parameter n,
                             ;   so when the closure is called, that is the n
                             ;   that will be used
       lst))

(define (add-n-maker n)
  (lambda (x) (+ n x)))

(let ((add-n-fn (add-n-maker 3)))
  (map add-n-fn '(3 5 4)))

(map (add-n-maker 3) '(3 5 4))

(define (call-on-5 func)
  (func 5))

(call-on-5 (add-n-maker 2))

(let ((plus2 (add-n-maker 2)))
  (call-on-5 pluS2))

