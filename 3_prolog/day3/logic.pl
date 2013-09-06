valid([]).
valid([Head|Tail]) :- fd_exactly(1, Head, 1),
                      valid(Tail).

logic(Puzzle, Solution) :- Solution = Puzzle,
                           Puzzle = [S11, S12, S13,
                                     S21, S22, S23,
                                     S31, S32, S33],

                           fd_domain_bool([S11, S12, S13, S21, S22, S23, S31, S32, S33]),

                           Row1 = [S11, S12, S13],
                           Row2 = [S21, S22, S23],
                           Row3 = [S31, S32, S33],
                             
                           Col1 = [S11, S21, S31],
                           Col2 = [S12, S22, S32],
                           Col3 = [S13, S23, S33],
                             
                           valid([Row1, Row2, Row3, Col1, Col2, Col3]).
%          9 41 45
% matthew  1  2  3
%  graeme  4  5  6
%  audrey  7  8  9

age(1,  matthew, 9).
age(2,  matthew, 41).
age(3,  matthew, 45).
age(4, ' graeme', 9).
age(5, ' graeme', 41).
age(6, ' graeme', 45).
age(7, ' audrey', 9).
age(8, ' audrey', 41).
age(9, ' audrey', 45).

age(FirstName, Age, Solution, Value) :- age(X, FirstName, Age),
                                        nth(X, Solution, Value).

isAged(FirstName, Age, Solution) :- age(FirstName, Age, Solution, 1).

isNotAged(FirstName, Age, Solution) :- age(FirstName, Age, Solution, 0).

%Person1 is older than Person2
isOlder(FirstName1, FirstName2, Solution) :- isAged(FirstName1, Age1, Solution),
                                             isAged(FirstName2, Age2, Solution),
                                             Age1 > Age2.

result([], _).
result([X|R], Index) :- age(Index, A, B),
                        write(X), write(' : '), write(A), write(' '), write(B), nl,
                        NextIndex is Index + 1,                         
                        result(R, NextIndex).

%          9 41 45
% matthew  
%  graeme     X
%  audrey

solvePuzzle(Solution) :- Puzzle = [_, _, _, _, _, _, _, _, _],
                         logic(Puzzle, Solution),
                         isNotAged(' graeme', 41, Solution),
                         %isOlder(' graeme', matthew, Solution),
                         fd_labeling(Puzzle),
                         result(Solution, 1).
