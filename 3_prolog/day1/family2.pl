%X is the brother of christina
%brother(christina, X).
%Y is the gender of christina
%gender(christina, Y).
%X is a child of family
%child(family, X).

%Forrest is the brother of Christina.
brother(christina, forrest).
%Christina is the sister of Forrest.
sister(forrest, christina).
%Forrest is a boy and Christina is a girl.
gender(forrest, male).
gender(christina, female).
%Forrest and Christina are the children of the family.
child(family, forrest).
child(family, christina).

daughter(F, X) :- child(F, X), gender(X, female).
son(F, X) :- child(F, X), gender(X, male).
%daughter(F, X).
%son(F, X).

sibling(A, B) :- child(Z, A), child(Z, B), \+(A = B).

%:- initialization(main(A,B) :- sibling(A, B)).
