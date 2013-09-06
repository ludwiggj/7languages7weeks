valid([]).
valid([Head|Tail]) :- fd_exactly(1, Head, 1),
                      valid(Tail).

logicPuzzle(Puzzle, Solution) :- GridAB = [AB11, AB12, AB13, AB21, AB22, AB23, AB31, AB32, AB33],
                             fd_domain_bool(GridAB),
                             GridAC = [AC11, AC12, AC13, AC21, AC22, AC23, AC31, AC32, AC33],
                             fd_domain_bool(GridAC),
                             GridBC = [BC11, BC12, BC13, BC21, BC22, BC23, BC31, BC32, BC33],
                             fd_domain_bool(GridBC),
                             Puzzle = [GridAB, GridAC, GridBC],
                             Solution = Puzzle,
                             %Rows and columns for GridAB
                             RowAB1 = [AB11, AB12, AB13], RowAB2 = [AB21, AB22, AB23], RowAB3 = [AB31, AB32, AB33],
                             ColAB1 = [AB11, AB21, AB31], ColAB2 = [AB12, AB22, AB32], ColAB3 = [AB13, AB23, AB33],
                             %Rows and columns for GridAC
                             RowAC1 = [AC11, AC12, AC13], RowAC2 = [AC21, AC22, AC23], RowAC3 = [AC31, AC32, AC33],
                             ColAC1 = [AC11, AC21, AC31], ColAC2 = [AC12, AC22, AC32], ColAC3 = [AC13, AC23, AC33],
                             %Rows and columns for GridBC
                             RowBC1 = [BC11, BC12, BC13], RowBC2 = [BC21, BC22, BC23], RowBC3 = [BC31, BC32, BC33],
                             ColBC1 = [BC11, BC21, BC31], ColBC2 = [BC12, BC22, BC32], ColBC3 = [BC13, BC23, BC33],
                             %Logic puzzle validity rule
                             valid([RowAB1, RowAB2, RowAB3, ColAB1, ColAB2, ColAB3,
                                    RowAC1, RowAC2, RowAC3, ColAC1, ColAC2, ColAC3,
                                    RowBC1, RowBC2, RowBC3, ColBC1, ColBC2, ColBC3]).

%Facts and rules for full name

name(1,   matthew, eggnog). name(2,   matthew, ludwig). name(3,   matthew, wigwam).
name(4, ' graeme', eggnog). name(5, ' graeme', ludwig). name(6, ' graeme', wigwam).
name(7, ' audrey', eggnog). name(8, ' audrey', ludwig). name(9, ' audrey', wigwam).

name(FirstName, Surname, GridFullName, Value) :- name(X, FirstName, Surname),
                                                 nth(X, GridFullName, Value).

     isName(FirstName, Surname, GridFullName) :- name(FirstName, Surname, GridFullName, 1).

  isNotName(FirstName, Surname, GridFullName) :- name(FirstName, Surname, GridFullName, 0).

%Facts and rules for first name by age

firstNameAge(1,   matthew, 9). firstNameAge(2,   matthew, 41). firstNameAge(3,   matthew, 45).
firstNameAge(4, ' graeme', 9). firstNameAge(5, ' graeme', 41). firstNameAge(6, ' graeme', 45).
firstNameAge(7, ' audrey', 9). firstNameAge(8, ' audrey', 41). firstNameAge(9, ' audrey', 45).

firstNameAge(FirstName, Age, GridFirstNameAge, Value) :- firstNameAge(X, FirstName, Age),
                                                         nth(X, GridFirstNameAge, Value).

    firstNameIsAged(FirstName, Age, GridFirstNameAge) :- firstNameAge(FirstName, Age, GridFirstNameAge, 1).

 firstNameIsNotAged(FirstName, Age, GridFirstNameAge) :- firstNameAge(FirstName, Age, GridFirstNameAge, 0).

%FirstName1 is older than FirstName2
isOlderByFirstName(FirstName1, FirstName2, GridFirstNameAge) :- firstNameIsAged(FirstName1, Age1, GridFirstNameAge),
                                                                firstNameIsAged(FirstName2, Age2, GridFirstNameAge),
                                                                Age1 > Age2.

%Facts and rules for surname by age

surnameAge(1, eggnog, 9). surnameAge(2, eggnog, 41). surnameAge(3, eggnog, 45).
surnameAge(4, ludwig, 9). surnameAge(5, ludwig, 41). surnameAge(6, ludwig, 45).
surnameAge(7, wigwam, 9). surnameAge(8, wigwam, 41). surnameAge(9, wigwam, 45).

surnameAge(Surname, Age, GridSurnameAge, Value) :- surnameAge(X, Surname, Age),
                                                   nth(X, GridSurnameAge, Value).

    surnameIsAged(Surname, Age, GridSurnameAge) :- surnameAge(Surname, Age, GridSurnameAge, 1).

 surnameIsNotAged(Surname, Age, GridSurnameAge) :- surnameAge(Surname, Age, GridSurnameAge, 0).


%Deduce answers in Grid3 based on answers in Grid1 and Grid2
resolveGrid(_, [], _) :- true.
resolveGrid([Grid1, Grid2, Grid3], [Grid1Pos, Grid2Pos|Tail], DeducedPos) :-
           (nth(Grid1Pos, Grid1, 1), nth(Grid2Pos, Grid2, 1), nth(DeducedPos, Grid3, 1)
           -> true;
              resolveGrid([Grid1, Grid2, Grid3], Tail, DeducedPos)).

%Use brute force
resolveGrid(Solution) :- resolveGrid(Solution, [1, 1, 4, 4, 7, 7], 1),
                         resolveGrid(Solution, [1, 2, 4, 5, 7, 8], 2),
                         resolveGrid(Solution, [1, 3, 4, 6, 7, 9], 3),
                         resolveGrid(Solution, [2, 1, 5, 4, 8, 7], 4),
                         resolveGrid(Solution, [2, 2, 5, 5, 8, 8], 5),
                         resolveGrid(Solution, [2, 3, 5, 6, 8, 9], 6),
                         resolveGrid(Solution, [3, 1, 6, 4, 9, 7], 7),
                         resolveGrid(Solution, [3, 2, 6, 5, 9, 8], 8),
                         resolveGrid(Solution, [3, 3, 6, 6, 9, 9], 9).

%Display routines
displayColTitle([], _) :- nl.
displayColTitle([Title|R], Spacer) :- write(Title), write(Spacer), write(':'), write(Spacer),
                                      displayColTitle(R, Spacer).

displayColTitlesFullName :- name(1, _, Col1Title), name(2, _, Col2Title), name(3, _, Col3Title),
                            write('         '),
                            displayColTitle([Col1Title, Col2Title, Col3Title], '  ').

displayColTitlesFirstNameByAge :- firstNameAge(1, _, Col1Title), firstNameAge(2, _, Col2Title), firstNameAge(3, _, Col3Title),
                                  write('            '),
                                  displayColTitle([Col1Title, Col2Title, Col3Title], '    ').

displayColTitlesSurnameByAge :- surnameAge(1, _, Col1Title), surnameAge(2, _, Col2Title), surnameAge(3, _, Col3Title),
                                write('            '),
                                displayColTitle([Col1Title, Col2Title, Col3Title], '    ').

displayRow([], _).
displayRow([X, Y, Z|R], [RowTitle|S]) :- write(RowTitle), write(' | '), write('  '),
                                         write(X), write('          '),
                                         write(Y), write('          '),
                                         write(Z), nl,     
                                         displayRow(R, S).

displayRowsFullName(List) :- name(1, Row1Title, _), name(4, Row2Title, _), name(7, Row3Title, _),
                             displayRow(List, [Row1Title, Row2Title, Row3Title]).

displayRowsFirstNameByAge(List) :- firstNameAge(1, Row1Title, _), firstNameAge(4, Row2Title, _), firstNameAge(7, Row3Title, _),
                                   displayRow(List, [Row1Title, Row2Title, Row3Title]).

displayRowsSurameByAge(List) :- surnameAge(1, Row1Title, _), surnameAge(4, Row2Title, _), surnameAge(7, Row3Title, _),
                                displayRow(List, [Row1Title, Row2Title, Row3Title]).

displayResults([GridFullName, GridFirstNameAge, GridSurnameAge]) :- displayColTitlesFullName,
                                                                    displayRowsFullName(GridFullName),
                                                                    nl,
                                                                    displayColTitlesFirstNameByAge,
                                                                    displayRowsFirstNameByAge(GridFirstNameAge),
                                                                    nl,
                                                                    displayColTitlesSurnameByAge,
                                                                    displayRowsSurameByAge(GridSurnameAge).

% Main rule
solvePuzzle1(Solution) :- %Setup
                          GridFullName     = [_, _, _, _, _, _, _, _, _],
                          GridFirstNameAge = [_, _, _, _, _, _, _, _, _],
                          GridSurnameAge   = [_, _, _, _, _, _, _, _, _],
                          Puzzle = Solution,
                          Solution = [GridFullName, GridFirstNameAge, GridSurnameAge],
                          logicPuzzle(Puzzle, Solution),
                          %Specific rules for this puzzle
                          isName(matthew, ludwig, GridFullName),
                          isName(' audrey', eggnog, GridFullName),
                          firstNameIsNotAged(' graeme', 41, GridFirstNameAge),
                          isOlderByFirstName(' graeme', matthew, GridFirstNameAge),
                          isOlderByFirstName(matthew, ' audrey', GridFirstNameAge),
                          %Resolve answers for surname / ages
                          resolveGrid(Solution),
                          %Results
                          displayResults(Solution).

% A second puzzle
solvePuzzle2(Solution) :- %Setup
                          GridFullName     = [_, _, _, _, _, _, _, _, _],
                          GridFirstNameAge = [_, _, _, _, _, _, _, _, _],
                          GridSurnameAge   = [_, _, _, _, _, _, _, _, _],
                          Puzzle = Solution,
                          Solution = [GridFullName, GridFirstNameAge, GridSurnameAge],
                          logicPuzzle(Puzzle, Solution),
                          %Specific rules for this puzzle
                          firstNameIsNotAged(' graeme', 41, GridFirstNameAge),
                          isOlderByFirstName(' audrey', matthew, GridFirstNameAge),
                          surnameIsNotAged(eggnog, 9, GridSurnameAge),
                          surnameIsAged(ludwig, 41, GridSurnameAge),
                          surnameIsNotAged(wigwam, 45, GridSurnameAge),
                          %Resolve answers for first name / surname
                          resolveGrid(Solution),
                          %Results
                          displayResults(Solution).
