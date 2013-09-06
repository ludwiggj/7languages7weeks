father(zeb, john_boy_snr).
father(john_boy_snr, john_boy_jnr).

ancestor(X, Y) :- father(X, Y).

ancestor(X, Y) :- father(X, Z), ancestor(Z, Y).
