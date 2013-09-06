-module(oxo).
-export([winner/1]).

winningLines(List) -> [[lists:nth(N, List) || N <- [1, 2, 3]],
                       [lists:nth(N, List) || N <- [4, 5, 6]],
                       [lists:nth(N, List) || N <- [7, 8, 9]],
                       [lists:nth(N, List) || N <- [1, 4, 7]],
                       [lists:nth(N, List) || N <- [2, 5, 8]],
                       [lists:nth(N, List) || N <- [3, 6, 9]],
                       [lists:nth(N, List) || N <- [1, 5, 9]],
                       [lists:nth(N, List) || N <- [7, 5, 3]]].

winner(Board) -> case the_champion(winningLines(Board)) of
                  x -> x;
                  o -> o;
                  no_winner -> no_winner
                end.

the_champion([["O","O","O"]|_]) -> o;
the_champion([["X","X","X"]|_]) -> x;
the_champion([_|T]) -> the_champion(T);
the_champion([]) -> no_winner.

the_champ(WinningLines) ->
                % Anonymous functions used to compose top level functions
                CellIsX = fun(X) -> X == "X" end,
                CellsAreAllX = fun(Line) -> lists:all(CellIsX, Line) end,
                CellIsO = fun(X) -> X == "O" end,
                CellsAreAllO = fun(Line) -> lists:all(CellIsO, Line) end,                                
                % Top level functions used in if statement
                Xwins = lists:any(CellsAreAllX, WinningLines),
                Owins = lists:any(CellsAreAllO, WinningLines),
                if
                  Xwins                      -> x;
                  Owins                      -> o;
%                  MovesLeft                  -> in_the_balance;
%                  NoMovesLeft                -> its_a_draw;
                  true  -> no_winner
                end.

% NumberOfXsInGrid = length(lists:filter(CellIsX, List)),
% NumberOfOsInGrid = length(lists:filter(CellIsO, List)),
% CellIsEmpty = fun(X) -> not CellIsX(X) and not CellIsO(X) end,
% CellIsNotEmpty = fun(X) -> not CellIsEmpty(X) end,
% MovesLeft = lists:any(CellIsEmpty, List),
% NoMovesLeft = lists:all(CellIsNotEmpty, List),
% TooManyXs = (NumberOfXsInGrid > NumberOfOsInGrid) and (NumberOfXsInGrid - NumberOfOsInGrid > 1),
% TooManyOs = (NumberOfOsInGrid > NumberOfXsInGrid) and (NumberOfOsInGrid - NumberOfXsInGrid > 1),
