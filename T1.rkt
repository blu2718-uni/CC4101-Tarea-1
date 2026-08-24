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
    [(nullp) "El polinomio nulo no tiene grado"]
    [(plus coef deg rem) (let ([comp deg])
     (match rem
       [(nullp) comp]
       [(plus coef deg rem) (if (> deg comp) 
				 (degree (plus coef deg rem))
				 (degree (plus coef comp rem)))])
     )]
    )
   )

#| Parte C |#

;; coefficient :: Integer Poly -> Integer
;; Retorna el coeficiente asociado con el exponente dado
(define (coefficient i poly)
  (match poly
    [(nullp) 0]
    [(plus coef deg rem) (if (equal? i deg)
			     coef
			     (coefficient i rem)
			     )])
  )


#| Parte D |#

;; nf? :: Poly -> Boolean
(define (nf? poly)
  (match poly
    [(nullp) #t]
    [(plus coef deg rem) (let ([comp deg])
     (match rem
       [(nullp) #t]
       [(plus coef deg rem)] (cond
			    [(zero? deg) (nf? (plus coef comp rem))]
			    [(<= deg comp) (nf? (plus coef deg rem))]
			    [else #f]))
#| Parte E |#

;; normalize :: Poly -> Poly
(define (normalize poly) '???)


#| Parte F |#

;; eval :: Integer Poly -> Integer
(define (eval val poly)
  (match poly
    [(nullp) 0]
    [(poly coef deg rem) (+ (expt (* val coef) deg) (eval val rem))]))


#| Parte G |#

;; map-poly :: (Integer Integer -> Integer * Integer) Poly -> Poly
(define (map-poly f poly) '???)


#| Parte H |#

;; fold-poly :: A (Integer Integer A -> A) -> (Poly -> A)
(define (fold-poly default f) '???)


#| Parte I |#

;; coefficient2 :: Integer Poly -> Integer
(define (coefficient2 i poly) '???)

;; eval2 :: Integer Poly -> Integer
(define (eval2 val poly) '???)

;; map-poly2 :: (Integer Integer -> Integer * Integer) Poly -> Poly
(define (map-poly2 f poly) '???)
