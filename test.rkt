#lang play

#|
Nombre: Julio Yáñez
|#

#| PARTE B |#

(test (degree (nullp)) "El polinomio nulo no tiene grado")
(test (degree (plus 3 0 (nullp))) 0)
(test (degree (plus 3 1 (nullp))) 1)
(test (degree (plus 4 5 (plus 3 2 (plus 5 0 (nullp))))) 5)

#| PARTE C |#

(test (coefficient 2 (nullp)) 0)
(test (coefficient 3 (plus 10 2 (plus 3 1 (nullp)))) 0)
(test (coefficient 2 (plus 10 2 (plus 3 1 (nullp)))) 10)

#| PARTE D |#

(test (nf? (nullp)) #f)
(test (nf? (plus (4 3 (plus 6 2 (plus 8 1 (nullp)))))) #t)
(test (nf? (plus 6 9 (plus (4 0 (plus 6 4 (plus 8 0 (nullp))))))) #t)
(test (nf? (plus (4 3 (plus 6 7 (plus 8 1 (nullp)))))) #f)
(test (nf? (plus 6 9 (plus (4 0 (plus 6 14 (plus 8 0 (nullp))))))) #f)

#| PARTE E |#

(test (normalize (nullp)) (nullp))
(test (normalize (plus (4 3 (plus 6 2 (plus 8 1 (nullp))))))
      (plus (4 3 (plus 6 2 (plus 8 1 (nullp))))))
(test (normalize (plus 6 9 (plus (4 0 (plus 6 4 (plus 8 0 (nullp)))))))
      (plus 6 9 (plus (4 0 (plus 6 4 (plus 8 0 (nullp)))))))
(test (normalize (plus (4 3 (plus 6 7 (plus 8 1 (nullp))))))
      (plus (6 7 (plus 4 3 (plus 8 1 (nullp))))))
(test (normalize (plus 6 9 (plus (4 0 (plus 6 14 (plus 8 0 (nullp)))))))
      (plus 6 14 (plus (4 0 (plus 6 9 (plus 8 0 (nullp)))))))

#| PARTE F |#

(test (eval 1 (nullp)) 0)
(test (eval 3 (plus 4 5 (plus 3 2 (plus 5 0 (nullp))))) 1004)
(test (eval 2 (plus 10 2 (plus 3 1 (nullp)))) 46)
(test (eval 4 (plus 15 0 (nulp))) 15)
(test (eval 3 (plus 7 1 (nullp))) 21)

#| PARTE G |#

(test (map-poly (lambda (c d) (cons (* c 2)) d) 
		(nullp)) 
      "No se puede mapear una función al polinomio nulo")
(test (map-poly (lambda (c d) (cons (* c 2)) d) 
		(plus 10 2 (plus 3 1 (nullp)))) 
      (plus 20 2 (plus 6 1 (nullp))))
(test (map-poly (lambda (c d) (cons (+ c 2)) d) 
		(plus 10 2 (plus 3 1 (nullp)))) 
      (plus 12 2 (plus 5 1 (nullp))))

#| PARTE H |#

(test
  ((fold-poly 0 
	      (lambda (coef deg a) (+ coef deg a)) 
   (plus 10 2 (plus 3 1 (nullp))))
   ) 
  16)

(test
  ((fold-poly 1 
	      (lambda (coef deg a) (* coef deg a)) 
   (plus 10 2 (plus 3 1 (nullp))))
   ) 
  60)

#| PARTE I |#

(test (coefficient2 2 (nullp)) 0)
(test (coefficient2 3 (plus 10 2 (plus 3 1 (nullp)))) 0)
(test (coefficient2 2 (plus 10 2 (plus 3 1 (nullp)))) 10)

(test (eval2 1 (nullp)) 0)
(test (eval2 3 (plus 4 5 (plus 3 2 (plus 5 0 (nullp))))) 1004)
(test (eval2 2 (plus 10 2 (plus 3 1 (nullp)))) 46)
(test (eval2 4 (plus 15 0 (nulp)) 15))
(test (eval2 3 (plus 7 1 (nullp))) 21)

(test (map-poly2 (lambda (c d) (cons (* c 2)) d) 
		(nullp)) 
      "No se puede mapear una función al polinomio nulo")
(test (map-poly2 (lambda (c d) (cons (* c 2)) d) 
		(plus 10 2 (plus 3 1 (nullp)))) 
      (plus 20 2 (plus 6 1 (nullp))))
(test (map-poly2 (lambda (c d) (cons (+ c 2)) d) 
		(plus 10 2 (plus 3 1 (nullp)))) 
      (plus 12 2 (plus 5 1 (nullp))))

(require "T1.rkt")
