"PESO PALABRA"
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
;insertar

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