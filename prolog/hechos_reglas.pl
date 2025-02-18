%HECHOS
  %es_gato(tom).
  %es_raton(jerry).
  %masgrande(elefante,caballo).
  %masgrande(caballo,perro).
  %masgrande(perro,raton).
  %masgrande(raton,hormiga).
  %masgrande(oso,perro,raton).
  padrede(martin,luis).
  padrede(luis,jose).
  padrede(luis,pedro).
  espadre(martin).
  espadre(luis).


%REGLAS
  %muchomasgrande(A,C):-
    %masgrande(A,B),
    %masgrande(B,C).

  hijode(B,A):-
    padrede(A,B).

  abuelode(A,C):-
    espadre(A),
    padrede(A,B),
    padrede(B,C).

  nietode(C,A):-
    padrede(A,B),
    padrede(B,C).

  hermanode(B,C):-
    B \= C,
    padrede(A,B),
    padrede(A,C).

  familiarde(A,B):-
    padrede(A,B);
    hijode(A,B);
    hermanode(A,B);
    abuelode(A,B);
    nietode(A,B).

%REGLAS_RECURSIVAS
  %muchomasgrande(A,B):-masgrande(A,B).
  %muchomasgrande(A,B):-masgrande(A,X),muchomasgrande(X,B).

