grande(pepe).
grande(cabeza(juan)).
grande(x):-mayor(X,Y).
mayor(cabeza(X),cabeza(Y)) :- es_progenitor(X,Y). 