"EJERCICIO 1"
(define-struct point (x y))

(define dist (lambda (p1 p2)
               (let ((x1 (point-x p1)) (x2 (point-x p2)) (y1 (point-y p1)) (y2 (point-y p2)))
                 (sqrt (+ (* (- x2 x1) (- x2 x1)) (* (- y2 y1) (- y2 y1))))
                 )))

(define p1 (make-point 1 1))
(define p2 (make-point 2 2))
(dist p1 p2)

"EJERCICIO 2"
(define-struct point3d (x y z))

(define sum_point (lambda (p1 p2)
                    (make-point3d (+ (point3d-x p1) (point3d-x p2))
                                  (+ (point3d-y p1) (point3d-y p2))
                                  (+ (point3d-z p1) (point3d-z p2))
                                  )
                    ))

(define sumatoria (lambda (list4)
                    (if (null? (cdr list4))
                        (car list4)
                        (sum_point (car list4) (sumatoria (cdr list4)))
                        )
                    ))

(define div_point (lambda (p lar)
                    (list (/ (point3d-x p) lar) (/ (point3d-y p) lar) (/ (point3d-z p) lar))
                    ))

(define center (lambda (list4)
                 (div_point (sumatoria list4) (length list4))
                 ))

(define p3 (make-point3d 1 1 1))
(define p4 (make-point3d 2 2 2))
(define p5 (make-point3d 3 3 3))
(define p6 (make-point3d 4 4 4))
(center (list p3 p4 p5 p6))

"EJERCICIO 3"
(define may_dist (lambda (p1 list4)
                   (if (null? list4)
                       0
                       (if (null? (cdr list4))
                           (dist p1 (car list4))
                           (let ((d (dist p1 (car list4))) (d2 (may_dist p1 (cdr list4))))
                             (if (> d2 d)
                                 d2
                                 d
                                 )
                             )
                           )
                       )
                   ))

(define dist-max-aux (lambda (list4)
                   (if (null? list4)
                       list4
                       (cons (may_dist (car list4) (cdr list4)) (dist-max-aux (cdr list4)))
                       )
                       ))

(define mayor (lambda (list4)
                (if (null? (cdr list4))
                    (car list4)
                    (let ((other (mayor (cdr list4))))
                      (if (> other (car list4))
                          other
                          (car list4)
                          )
                      )
                    )
                ))

(define dist-max (lambda (list4)
                   (mayor (dist-max-aux list4))
                   ))

(define pl1 (make-point 1 1))
(define pl2 (make-point 1 -1))
(define pl3 (make-point 1 3))
(define pl4 (make-point 1 4))

(dist-max (list pl1 pl2 pl3 pl4))

"EJERCICIO 4"
(define count-pal (lambda (text)
                    (if (symbol? (read text))
                          (+ 1 (count-pal text))
                          0
                          )
                    ))

(define count-char (lambda (text)
                    (if (char? (read-char text))
                          (+ 1 (count-char text))
                          0
                          )
                    ))

(define arch (open-input-file "prueba.txt"))
(count-pal arch)
(close-input-port arch)

(define arch (open-input-file "prueba.txt"))
(count-char arch)
(close-input-port arch)

"EJERCICIO 5"
(define cout (lambda (text)
                 (let ((word (read-line text)))
                   (if (eof-object? word)
                       (display "\n")
                       (and (display word) (cout text))
                       )
                   )
               ))

(define arch (open-input-file "prueba.txt"))
(cout arch)
(close-input-port arch)

"EJERCICIO 6"
(define pesopal (lambda (word)
                  (if (null? word)
                      0
                      (+ (char->integer (car word)) (pesopal (cdr word)))
                      )
                  ))

(define pesopalabra (lambda (list4)
                      (map cons list4 (map pesopal (map string->list list4)))
                    ))

(define menor (lambda (list4)
                (if (null? (cdr list4))
                    (car list4)
                    (let ((men2 (menor (cdr list4))) (men (car list4)))
                      (if (< (cdr men) (cdr men2))
                          men
                          men2
                      )
                      )
                      )
                    )
                )

(define inser (lambda (el list4)
                (if (null? list4)
                    (cons el list4)
                    (if (> (cdr el) (cdr (car list4)))
                        (cons (car list4) (inser el (cdr list4)))
                        (cons el list4)
                        )
                    )
                ))

(define ord (lambda (list4)
              (if (null? list4)
                  '()
                  (inser (car list4) (ord (cdr list4)))
                  )
              ))

(define ordenar (lambda (list4)
                  (map car (ord (pesopalabra list4)))
                  ))

(ordenar '("moto" "auto" "casa" "juego" "aire"))

"EJERCICIO 7"
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

(inv-list '(1 (2 3 4 (4 5) (3 (5 6)) 4)))

"EJERCICIO 8"
(define concatenar (lambda (l1 l2)
                     (if (null? l1)
                         l2
                         (cons (car l1) (concatenar (cdr l1) l2))
                         )
                     ))

(define app2list (lambda (x y)
                   (if (list? y)
                       (if (list? x)
                           (concatenar x y)
                           (cons x y)
                           )
                       (if (list? x)
                           (cons y x)
                           (cons x (cons y '()))
                           )
                       )
                   ))

(app2list '(1 2 3 d f) '("ramon" t p z))