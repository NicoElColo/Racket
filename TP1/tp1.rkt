"EJERCICIO 1"
(+ 7 (* 2 -1/3) -10.7)
(/ (* 7/3 5/9)(- 5/8 2/3))
(+ 1 (/ 3 (+ 2 (/ 1 (+ 5 1/2)))))
(* 1 -2 3 -4 5 -6 7)

"EJERCICIO 2"
(cons 'car '+)
(list 'esto '(es muy fácil))
(cons 'pero '(se está complicando...))
(cons '(y ahora no se que ) 'hizo)
(quote (+ 7 2))
(cons '+ '(10 3))
(car '(+ 10 3))
(cdr '(+ 10 3))
cons
(quote (cons (car (cdr (7 4)))) )
(quote cons)
(car (quote (quote cons)))
(+ 2 3)
(+ '2 '3)
(+ (car '(2 3)) (car (cdr '(2 3))))
((car (list + - * /)) 2 3)

"EJERCICIO 3"
(car (car '((a b) (c d))))
(car (cdr (car '((a b) (c d)))))
(car (car (cdr '((a b) (c d)))))
(car (cdr (car (cdr '((a b) (c d))))))

"EJERCICIO 4"
(cdr (cdr '((a b) (c d))))
(cdr (car '((a b) (c d))))
(cdr (car (cdr '((a b) (c d)))))
(car '((a b) (c d)))

;"EJERCICIO 5"
;Expresion a evaluar: ((car (cdr (cdr (list + - * /)))) 5 5)
;primero se conforma una lista con los simbolos: + - * /
;de esa lista se toma la cola: (- * /)
;de esa cola se toma la cola: (* /)
;se toma el primer elemento de la lista anterior: *
;se calcula 5 * 5

"EJERCICIO 6"
(cdr (cdr (cdr '( a b c . x))))
(car (cdr (cdr (cdr '( a b c x)))))
(cdr (car '((a . x) b)))
(car '(x . a))
(cdr '(a . x))