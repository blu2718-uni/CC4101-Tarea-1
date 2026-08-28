#lang play

#|
Nombre: Julio Yáñez
¿Utilizó Whiteboard Policy? (SI o NO): NO
En caso afirmativo, ¿con quién?: -
¿en qué ejercicio(s)?: -
|#

;;------------ ;;
;;==== P1 ==== ;;
;;------------ ;;

#| Parte A |#

#|
<Poly> ::= (plus <Int> <Int> <Poly>) | (nullp)
<Int>  ::= ...
|#

(deftype Poly
  (plus coef deg rem)
  (nullp)
  )

#| Parte B |#

;; degree :: Poly -> Integer
;; Retorna el grado del polinomio
(define (degree poly)
  (match poly
    [(nullp) (error "El polinomio nulo no tiene grado")]
    [(plus c d r) (let ([comp d])
     (match r
       [(nullp) comp]
       [(plus c d r) (if (> d comp) 
				 (degree (plus c d r))
				 (degree (plus c comp r)))])
     )]
    )
   )

#| Parte C |#

;; coefficient :: Integer Poly -> Integer
;; Retorna el coeficiente asociado con el exponente dado
(define (coefficient i poly)
  (match poly
    [(nullp) 0]
    [(plus c d r) (if (equal? i d)
			     c
			     (coefficient i r)
			     )])
  )


#| Parte D |#

;; nf? :: Poly -> Boolean
(define (nf? poly)
  (match poly
    [(nullp) #f]
    [(plus 0 _ _) #f]
    [(plus c d r) (let ([comp (match r [(nullp) -1] [(plus _ d _) d])])
			(cond
			  [(eq? comp -1) #t]
			  [(<= comp d) (nf? r)]
			  [else #f]))]))
#| Parte E |#

;; normalize :: Poly -> Poly
(define (normalize poly)
  (match poly
    [(nullp) (nullp)]
    [(plus 0 _ r) (normalize r)]
    [(plus c d (nullp)) (plus c d (nullp))]
    [(plus c d r) (let* ([comp (match r [(plus c d r) (list c d r)])]
			 [result (cond
				   [(<= (list-ref comp 1) d) (plus c d (normalize r))]
				   [else (plus (list-ref comp 0) 
					       (list-ref comp 1) 
					       (normalize (plus c d (list-ref comp 2))))])])
		    (if (nf? result) 
			result
			(normalize result)))]))
			     
#| Parte F |#

;; eval :: Integer Poly -> Integer
(define (eval val poly)
  (match poly
    [(nullp) 0]
    [(plus coef deg rem) (+ (* coef (expt val deg)) (eval val rem))]))


#| Parte G |#

;; map-poly :: (Integer Integer -> Integer * Integer) Poly -> Poly
(define (map-poly f poly)
  (match poly
    [(nullp) (nullp)]
    [(plus c d r) (let ([res (f c d)])
			   (plus (car res) (cdr res) (map-poly f r)))]))


#| Parte H |#

;; fold-poly :: A (Integer Integer A -> A) -> (Poly -> A)
(define (fold-poly a f)
  (lambda (poly) (match poly
		    [(nullp) a]
		    [(plus c d r) (let ([next-a (f c d a)])
				    ((fold-poly next-a f) r))])))

#| Parte I |#

;; coefficient2 :: Integer Poly -> Integer
(define (coefficient2 i poly) 
  ((fold-poly 0 (lambda (c d a) (cond
				  [(not (zero? a)) a]
				  [(equal? i d) c]
				    [else 0]))) poly))

;; eval2 :: Integer Poly -> Integer
(define (eval2 val poly)
			      ((fold-poly 0 (lambda (c d a) ((* (expt val d) c)))) poly))

;; map-poly2 :: (Integer Integer -> Integer * Integer) Poly -> Poly
(define (map-poly2 f poly) 
  ((fold-poly (nullp) (lambda (c d) (f c d))) poly))
