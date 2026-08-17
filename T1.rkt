#lang play

#|
Nombre: 
¿Utilizó Whiteboard Policy? (SI o NO):
En caso afirmativo, ¿con quién?:
¿en qué ejercicio(s)?:
|#

;;------------ ;;
;;==== P1 ==== ;;
;;------------ ;;

#| Parte A |#

#|
<poly> ::= 
|#

(deftype Poly
  ;...
  )


#| Parte B |#

;; degree :: Poly -> Integer
(define (degree poly) '???)


#| Parte C |#

;; coefficient :: Integer Poly -> Integer
(define (coefficient i poly) '???)


#| Parte D |#

;; nf? :: Poly -> Boolean
(define (nf? poly) '???)


#| Parte E |#

;; normalize :: Poly -> Poly
(define (normalize poly) '???)


#| Parte F |#

;; eval :: Integer Poly -> Integer
(define (eval val poly) '???)


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