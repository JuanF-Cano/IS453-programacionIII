%Hechos.
padre_de(aurelio, claudia).
padre_de(aurelio, fernando).
padre_de(aurelio, jhoana).
padre_de(orlando, sandra).
padre_de(orlando, jhon).
padre_de(orlando, cristian).
padre_de(fernando, mateo).
padre_de(fernando, juan).
padre_de(fernando, salome).

madre_de(ines, claudia).
madre_de(ines, fernando).
madre_de(ines, jhoana).
madre_de(judit, sandra).
madre_de(judit, jhon).
madre_de(judit, cristian).
madre_de(sandra, juan).
madre_de(sandra, mateo).
madre_de(sandra, salome).
madre_de(claudia, santiago).
madre_de(jhoana, andrea).

es_mujer(ines).
es_mujer(judit).
es_mujer(claudia).
es_mujer(sandra).
es_mujer(jhoana).
es_mujer(andrea).
es_mujer(salome).

es_hombre(aurelio).
es_hombre(orlando).
es_hombre(fernando).
es_hombre(jhon).
es_hombre(cristian).
es_hombre(mateo).
es_hombre(juan).
es_hombre(santiago).

%Reglas.
abuelo_de(X, Y):-
    es_hombre(X),
    padre_de(X, Z),
    (padre_de(Z, Y); madre_de(Z, Y)).

abuela_de(X, Y):-
    es_mujer(X),
    madre_de(X, Z),
    (padre_de(Z, Y); madre_de(Z, Y)).

hermano_de(X, Y) :-
    es_hombre(X),
    ((padre_de(Z, X), padre_de(Z, Y)), (madre_de(W, X), madre_de(W, Y));
    (padre_de(Z, X), padre_de(Z, Y)); (madre_de(W, X), madre_de(W, Y))),
    X \= Y.

hermana_de(X, Y) :-
    es_mujer(X),
    ((padre_de(Z, X), padre_de(Z, Y)), (madre_de(W, X), madre_de(W, Y));
    (padre_de(Z, X), padre_de(Z, Y)); (madre_de(W, X), madre_de(W, Y))),
    X \= Y.

tio_de(X, Y) :-
    (padre_de(Z, Y), hermano_de(X, Z)); (madre_de(Z, Y), hermano_de(X, Z)).

tia_de(X, Y) :-
    (padre_de(Z, Y), hermana_de(X, Z)); (madre_de(Z, Y), hermana_de(X, Z)).

primo_de(X, Y) :-
    es_hombre(X),
    (tio_de(Z, Y); tia_de(Z, Y)),
    (padre_de(Z, X); madre_de(Z, X)).

prima_de(X, Y) :-
    es_mujer(X),
    (tio_de(Z, Y); tia_de(Z, Y)),
    (padre_de(Z, X); madre_de(Z, X)).