estadounidense(coronel_west).
nacion_hostil(corea_sur). 
arma(misil).
vendio(coronel_west, misil, corea_sur).

criminal(X) :- estadounidense(X), nacion_hostil(Y), arma(Z), vendio(X, Z, Y).