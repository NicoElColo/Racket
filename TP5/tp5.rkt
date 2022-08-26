"EJERCICIO 2"
(define pertenece (lambda (el l1 l2)
                    (if (null? l1)
                        #f
                        (if (null? l2)
                            #f
                            (if (eqv? el (car l1))
                                (if (eqv? el (car l2))
                                    #t
                                    (pertenece el l1 (cdr l2))
                                    )
                                (pertenece el (cdr l1) l2)
                                )
                            )
                        )
                    ))

(pertenece 'a '(a b c) '(r f g a))
(pertenece 'a '(a b c) '(r f g h))

"EJERCICIO 3"
(define cant-izq (lambda (el list4)
                   (if (null? list4)
                       (display "error, el elemento no se encuentra en la lista")
                       (if (eqv? el (car list4))
                           0
                           (+ 1 (cant-izq el (cdr list4)))
                           )
                       )
                   ))
(cant-izq 'd '(a b c d e f))

"EJERCICIO 4"
(define addif (lambda (el list4)
                (if (null? list4)
                    (cons el list4)
                    (if (eqv? el (car list4))
                        list4
                        (cons (car list4) (addif el (cdr list4)))
                        )
                    )
                ))
(addif 'a '(b c d))
(addif 'a '(a b c d))
(addif 'c '(b c d))

"EJERCICIO 5"
(define fechap (lambda (dia mes anio)
                 (if (> mes 12)
                     #f
                     (if (> dia 31)
                         #f
                         (if (and (eqv? 2 mes) (> dia 28))
                             #f
                             (if (and (or (eqv? mes 1) (eqv? mes 3) (eqv? mes 5) (eqv? mes 7) (eqv? mes 9) (eqv? mes 11)) (> dia 30))
                                 #f
                                 #t
                                 )
                             )
                         )
                     )
                 ))

(fechap 12 12 1986)
(fechap 12 30 1987)
(fechap 31 2 1986)
(fechap 31 11 1976)

"EJERCICIO 6"
(define get-prof (lambda (list4)
                   (if (null? list4)
                       0
                       (if (list? (car list4))
                           (let ((prof1 (+ 1 (get-prof (car list4)))) (prof2 (get-prof (cdr list4))))
                             (if (> prof1 prof2)
                                 prof1
                                 prof2
                                 )
                             )
                           (get-prof (cdr list4))
                           )
                       )
                   ))
(get-prof '((1 (2)) (((5 7)) 4)))

"EJERCICIO 7"
(define concatenar (lambda (l1 l2)
                     (if (null? l1)
                         l2
                         (cons (car l1) (concatenar (cdr l1) l2))
                         )
                     ))

(define aplanar (lambda (list4)
                  (if (null? list4)
                      '()
                      (if (list? (car list4))
                          (concatenar (aplanar (car list4)) (aplanar (cdr list4)))
                          (cons (car list4) (aplanar (cdr list4)))
                          )
                      )
                  ))
(aplanar '((1 2 3) (9 (2 3 4)) ((((3 4 (7)))))))

"EJERCICIO 8"
;agarrar el utlimo
;cons con el cdr invertido de la lista invertida

;concatena el elemento al final de la lista
(define conc-el (lambda (lista el)
                  (if (null? lista)
                      (cons el lista)
                      (cons (car lista) (conc-el (cdr lista) el))
                      )
                  ))

;invierte 
(define inv-list (lambda (lista)
                   (if (null? lista)
                       '()
                       (if (list? (car lista))
                           (conc-el (inv-list (cdr lista)) (inv-list (car lista)))
                           (if (null? (cdr lista))
                               lista
                               (conc-el (inv-list (cdr lista)) (car lista))
                               )
                           )
                       )
                   ))

(define get-last (lambda (list4)
                   (if (null? list4)
                       (display "error")
                       (if (null? (cdr list4))
                           (car list4)
                           (get-last (cdr list4))
                           )
                       )
                   ))

(define derecha (lambda (list4)
                  (cons (get-last list4) (inv-list (cdr (inv-list list4))))
                  ))

(define izquierda (lambda (list4)
                    (concatenar (cdr list4) (cons (car list4) '()))
                    ))

(define rotar (lambda (func list4)
                (if (eqv? func 'derecha)
                    (derecha list4)
                    (izquierda list4)
                    )
                ))

(rotar 'derecha '(1 2 3 4))
(rotar 'izquierda '(1 2 3 4))

"EJERCICIO 9"
(define calc-cuadr (lambda (list4)
                     (if (null? list4)
                         (display "error")
                         (map (lambda (x) (* x x)) list4)
                         )
                     ))

(calc-cuadr '(1 2 3 4))

"EJERCICIO 10"
(define existe (lambda (el list4)
                 (if (null? list4)
                     #f
                     (if (eqv? el (car list4))
                         #t
                         (existe el (cdr list4))
                         )
                     )
                 ))

(define resta-listas (lambda (list1 list2)
                       (if (null? list1)
                           list1
                           (if (existe (car list1) list2)
                               (resta-listas (cdr list1) list2)
                               (cons (car list1) (resta-listas (cdr list1) list2))
                               )
                           )
                       ))

(resta-listas '(1 2 3 4) '(2 3))

"EJERCICIO 11"
(define suma-listas (lambda (list1 list2)
                       (if (null? list2)
                           list1
                           (if (existe (car list2) list1)
                               (suma-listas list1 (cdr list2))
                               (cons (car list2) (suma-listas list1 (cdr list2)))
                               )
                           )
                      ))

(suma-listas '(1 2 3 4) '(2 3 5))

"EJERCICIO 12"
(define altura (lambda (list4)
                 (+ 1 (get-prof list4))
                 ))

(altura '(1 (4 (7) (6)) (3 (5) (4))))