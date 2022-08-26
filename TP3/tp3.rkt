"EJERCICIO 1"
(define factorial (lambda (num)
                    (if (= num 1)
                        1
                        (* num (factorial (- num 1)))
                        )))
(factorial 4)


"EJERCICIO 2"
(define largo (lambda (list)
                (if (null? list)
                    0
                    (+ (largo (cdr list)) 1)
                    )))
(largo '(2 3 4 5 6 7 8 9))


"EJERCICIO 3"
(define count-el (lambda (el list)
                   (if (null? list)
                       0
                       (if (eqv? el (car list))
                           (+ (count-el el (cdr list)) 1)
                           (+ (count-el el (cdr list)) 0)
                       ))))

(count-el 3 '(1 14 3 54 2 3 43 6 3 8 9 0 3 2))


"EJERCICIO 4"
(define subst (lambda (find reem list)
                     (if (null? list)
                         ()
                         (if (eqv? (car list) find)
                             (cons reem (subst find reem (cdr list)))
                             (cons (car list) (subst find reem (cdr list)))
                             ))))

'(2 3 3 5 32 4 6 7 8 3)
(subst 3 4 '(2 3 3 5 32 4 6 7 8 3))


"EJERCICIO 5"
(define agrupar (lambda (lista)
                  (if (null? lista)
                      '()
                      (letrec ((eliminar (lambda (x lista)
                                           (if (null? lista)
                                               '()
                                               (if (eqv? x (car lista))
                                                   (eliminar x (cdr lista))
                                                   (cons (car lista) (eliminar x (cdr lista)))
                                                   )
                                               )
                                           )
                                         ))
                        (cons (vector->list (make-vector (count-el (car lista) lista) (car lista)))
                              (agrupar (eliminar (car lista) lista)))
                        )
                      )
                  ))

(agrupar '(A A B C A B A D C))


"EJERCICIO 6"
(define concatenar (lambda (l1 l2)
                     (if (null? l1)
                         l2
                         (cons (car l1) (concatenar (cdr l1) l2))
                         )
                     ))

(concatenar '(a b c d) '(e f g h))


"EJERCICIO 7"
(define first-num (lambda (lista)
                    (if (null? lista)
                        null
                        (if (number? (car lista))
                            (car lista)
                            (first-num (cdr lista))
                            )
                        )
                    ))

(first-num '((1 . 2) 'a (b) (5) 6 8 'a 9))


"EJERCICIO 8"
(define attach-at-end (lambda (x lista)
                        (if (null? lista)
                            (cons x lista)
                            (cons (car lista) (attach-at-end x (cdr lista)))
                            )
                        ))

(attach-at-end 'prueba '(esto es una))


"EJERCICIO 9"
(define m-abs (lambda (lista)
              (if (null? lista)
                  '()
                  (if (< (car lista) 0)
                      (cons (- 0 (car lista)) (m-abs (cdr lista)))
                      (cons (car lista) (m-abs (cdr lista)))
                      )
                  )
              ))

(define text-number (lambda (lista)
                     (if (null? lista)
                         '()
                         (cons (string->number (car lista)) (text-number (cdr lista)))
                         )
                      ))

(define bool-number (lambda (lista)
                      (if (null? lista)
                          '()
                          (if (eqv? (car lista) "V")
                              (cons 1 (bool-number (cdr lista)))
                              (cons 0 (bool-number (cdr lista)))
                              )
                          )
                      ))

(define setter (lambda (lista)
                 (if (null? lista)
                     '()
                     (cond
                       ((eqv? (car lista) "D")
                        (m-abs (car (cdr lista)))
                        )
                       ((eqv? (car lista) "T")
                        (m-abs (text-number (car (cdr lista))))
                        )
                       (else
                        (bool-number (car (cdr lista)))
                        )
                       )
                     )
                 ))

(define conv-datos (lambda (lista)
                     (if (null? lista)
                         '()
                         (cons (setter (car lista)) (conv-datos (cdr lista)))
                         )
                     ))

(conv-datos '(("D" (1 2 -3 4 -5)) ("T" ("6" "7" "8")) ("B" ("V" "F"))))


"EJERCICIO 10"
(define distance2d (lambda (punto1 punto2)
                     (let ((x1 (car punto1)) (y1 (cdr punto1)) (x2 (car punto2)) (y2 (cdr punto2)))
                       (let ((xd (- x2 x1)) (yd (- y2 y1)))
                         (sqrt(+ (* xd xd) (* yd yd)))))))

(define distancias (lambda (lista)
                     (if (null? lista)
                         '()
                         (if (null? (cdr lista))
                             '()
                             (cons (distance2d (car lista) (car (cdr lista))) (distancias (cdr lista)))
                             )
                         )
                     ))

(distancias '((1 . 1) (1 . 2) (2 . 2) (2 . 1) (1 . 1)))

