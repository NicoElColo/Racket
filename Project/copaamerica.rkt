(define count-el (lambda (el list)
                   (if (null? list)
                       0
                       (if (eqv? el (car list))
                           (+ (count-el el (cdr list)) 1)
                           (+ (count-el el (cdr list)) 0)
                       ))))

(define concatenar (lambda (l1 l2)
                     (if (null? l1)
                         l2
                         (cons (car l1) (concatenar (cdr l1) l2))
                         )
                     ))

(define aplanar (lambda (list4)
                  (if (null? list4)
                      list4
                      (if (list? (car list4))
                          (concatenar (aplanar (car list4)) (aplanar (cdr list4)))
                          (cons (caar list4) (aplanar (cdr list4)))
                          )
                      )
                  ))

(define eliminar (lambda (x lista)
             (if (null? lista)
                 '()
                 (if (eqv? x (car lista))
                     (eliminar x (cdr lista))
                     (cons (car lista) (eliminar x (cdr lista)))
                     )
                 )
                   ))

(define resultados (lambda (list4)
                     (if (null? list4)
                         list4
                         (cons (cons (car list4) (count-el (car list4) list4)) (resultados (eliminar (car list4) list4)))
                         )
                     ))

(define played-games (lambda (list4)
                       (resultados (aplanar list4))
                       ))

(played-games '(((Argentina . 5) (Brasil . 0 ))
           ((Argentina . 3) (Bolivia . 2))
           ((Argentina . 2) (Chile . 1))
           ((Bolivia . 1) (Paraguay . 0))
           ((Brasil . 1) (Venezuela . 0))
           ((Colombia . 0) (Ecuador . 2))
           ((Brasil . 2) (Ecuador . 1))))