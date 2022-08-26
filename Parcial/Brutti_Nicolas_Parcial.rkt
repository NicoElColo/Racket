;calcula las calorias del menu del dia
(define calcular-cal (lambda (lista)
                       (if (null? lista)
                           0
                           (let ((comida (car lista)))
                             (if (null? (cdr comida))
                                 (calcular-cal (cdr lista))
                                 (+ (cdr comida) (calcular-cal (cdr lista)))
                                 )
                             )
                           )
                       ))


;cambio la comida
(define camb (lambda (menu comida)
               (if (null? menu)
                   menu
                   (if (equal? (caar menu) (car comida))
                       (cons comida (cdr menu))
                       (cons (car menu) (camb (cdr menu) comida))
                       )
                   )
               ))

;se fija si reemplaza el menu o no
(define reemplazo (lambda (lista cal)
                    (if (null? lista)
                        lista
                        (let ((menu (car (cdr lista))) (reem (car (cdr (cdr lista)))))
                          (if (null? reem) ;si la comida a reemplazar es vacia devuelvo el mismo menu
                              (cons (car lista) (list menu)) ;meto el dia de la semana a una lista que tiene al menu para armar el formato de salida
                              (let ((menu-act (camb menu (car reem))) (menu-or menu)) ;cambio el menu y me guardo el original para armar la salida
                                (if (>= cal (calcular-cal menu-act)) ;si el nuevo menu no se pasa de las calorias lo reemplazo y sino devuelvo el original
                                    (cons (car lista) (list menu-act))
                                    (cons (car lista) (list menu-or))
                                    )
                                )
                              )
                          )
                        )
                    ))


;wrapper
(define camb-menu (lambda (cal menu)
                    (if (null? menu)
                        menu
                        (cons (reemplazo (car menu) cal) (camb-menu cal (cdr menu)))
                        )
                    ))


(define menu '(
  ("Lunes" ((DESAYUNO . 120)(ALMUERZO . 280)(MERIENDA . 110)(CENA . 220)) ((ALMUERZO . 380)) )
  ("Martes" ((DESAYUNO . 120)(ALMUERZO)(MERIENDA . 90)(CENA . 250)) ((ALMUERZO . 295)) )
  ("Miércoles" ((DESAYUNO . 125)(ALMUERZO . 270)(MERIENDA . 95)(CENA . 290)) ((CENA . 220)) )
  ("Jueves" ((DESAYUNO . 130)(ALMUERZO . 270)(MERIENDA . 120)(CENA . 280)) ((MERIENDA . 70)) )
  ("Viernes" ((DESAYUNO . 120)(ALMUERZO . 275)(MERIENDA . 115)(CENA . 270)) () )
))

(camb-menu 800 menu)