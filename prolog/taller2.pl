conexion(vancouver, edmonton, 16).
conexion(vancouver, calgary, 13).
conexion(edmonton, saskatoon, 12).
conexion(saskatoon, winnipeg, 20).
conexion(saskatoon, calgary, 9).
conexion(calgary, edmonton, 4).
conexion(calgary, regina, 14).
conexion(regina, saskatoon, 7).
conexion(regina, winnipeg, 4).

existe_conexion(A, B):- conexion(A, B, _); conexion(B, A, _).

tiene_aristas(X):-
    (conexion(X, Y, _); conexion(Y, X, _)), 
    X \== Y.

suma(X, Z, Suma):-
    conexion(X, Y, Costo1),
    conexion(Y, Z, Costo2),
    Suma is Costo1 + Costo2.

lleva_a(A, B):- conexion(A, B, _).
lleva_a(A, B):- (conexion(A, _, _), conexion(_, B, _)), conexion(A, X, _), lleva_a(X, B).