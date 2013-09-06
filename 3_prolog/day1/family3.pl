%gprolog --query-goal "[family3], siblings"
%gprolog --query-goal "[family3], sibling(A, B)"

family(forrest, child).
family(christina, child).
family(bob, child).
sibling(A, B) :- family(A, Z), family(B, Z), \+(A = B).

siblings :- sibling(_X, _Y), nl, write('siblings: '), write(_X), write(' '), write(_Y).

%--------------------------------------------------------------------------------------
%?- trace.
%sibling(forrest, christina).
%sibling(christina, forrest).
%sibling(X, forrest).
%sibling(christina, X).

%m(X) :- sibling(forrest, X).
%n :- sibling(forrest, _X), write('n: '), write(_X).

%gprolog --query-goal "[family3], trace, siblings"
