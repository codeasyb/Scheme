

(define my-reverse(lambda (lst)  ;  my-reverse because can't redefine built-ins
                    (if (null? lst) '( )
                        (snoc (my-reverse (cdr lst))
                              (car lst)))))

;; like cons, but adds member at tail of lst rather than head
;; equvalent to (append lst (list member))
(define snoc(lambda (lst member)
              (if (null? lst)(list member)
                  (cons (car lst)
                        (snoc (cdr lst) member)))))

(define my-append (lambda (x y)
                 (if (null? x) y
                     (cons (car x) (my-append (cdr x) y)))))

(define my-member (lambda (elt lst)
                 (if (null? lst) #f
                     (if (equal? elt (car lst)) lst
                         ( my-member   elt
                                    (cdr lst))))))
