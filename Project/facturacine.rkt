(define count (lambda (el list4)
                (if (null? list4)
                    0
                    (if (eqv? el (car list4))
                        (+ 1 (count el (cdr list4)))
                        (count el (cdr list4))
                        )
                    )
                ))

(define countel (lambda (el listlist)
                  (if (null? listlist)
                      0
                      (+ (count el (car listlist)) (countel el (cdr listlist)))
                      )
                 ))

(define organizar (lambda (list4)
                    (list (cons 1 (countel 1 list4)) (cons 2 (countel 2 list4)) (cons 3 (countel 3 list4)))
                    ))

(define factura-ind (lambda (list4)
                       (map (lambda (v n) (cons (car n) (* v (cdr n)))) '(300 150 100) (organizar list4))
                       ))

(define suma (lambda (list4)
               (if (null? list4)
                   0
                   (+ (cdr (car list4)) (suma (cdr list4)))
                   )
               ))

(define factura-cine (lambda (list4)
                       (cons (cons "total" (suma (factura-ind list4))) (factura-ind list4))
                       ))

(factura-cine '((0 0 0 1 1 0 2 0 1 0) (0 1 1 3 0 0 1 1 1 1) (1 1 1 3 3 1 1 1 0 2) (1 1 2 2 0 0 1 1 1 0)))