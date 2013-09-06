%Forrest is the brother of Christina.
brother(forrest,christina).
%Christina is the sister of Forrest.
sister(christina,forrest).
%Forrest is a boy and Christina is a girl.
gender(forrest,male).
gender(christina,female).
%Forrest and Christina are the children of the family.
family(forrest,child).
family(christina,child).

b(X) :- brother(X, christina).
f(X) :- family(X, child).
g(X) :- gender(christina, X).
