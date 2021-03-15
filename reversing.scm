(define redundant
  (lambda (lst)
    (if (null? lst)
        lst
        (cons (car lst) (redundant (cdr lst)))
        )
    )
  )

(define rev1
  (lambda (lst)
    (if (null? lst)
        lst
        (cons (cdr lst) (rev1 (car lst)))
        )
    )
  )

(define rev2
  (lambda (lst)
    (if (null? lst)
        lst
        (cons (rev2 (cdr lst)) (cons (car lst) '()) )
        )
    )
  )

(define rev3
  (lambda (lst)
    (if (null? (car lst))
        (car lst)
        (cons (rev3 (cdr lst)) (cons (car lst) '()) )
        )
    )
  )

(define rev4
  (lambda (lst)
    (if (null? (cdr lst))
        (car lst)
        (cons (rev4 (cdr lst)) (cons (car lst) '()) )
        )
    )
  )