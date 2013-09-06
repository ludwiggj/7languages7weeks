iterate([],[]).
iterate([X|R], Result) :- iterate(R, Remaining),
                          append([X,'*'], Remaining, Result).
