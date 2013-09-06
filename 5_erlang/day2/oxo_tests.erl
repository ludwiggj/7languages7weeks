-module(oxo_tests).
-include_lib("eunit/include/eunit.hrl").

% eunit:test(oxo). 
x_vertical_test() ->
  ?assertMatch(x, oxo:winner(["X", "X", " ",
                              "O", "X", "O",
                              "O", "X", "O"])).

x_diagonal_test() ->
  ?assertMatch(x, oxo:winner(["X", "X", " ",
                              "O", "X", "O",
                              "O", " ", "X"])).

o_diagonal_test() ->
  ?assertMatch(o, oxo:winner(["X", "X", "O",
                              "X", "O", "O",
                              "O", "X", "X"])).

o_horizontal_test() ->
  ?assertMatch(o, oxo:winner(["O", "O", "O",
                              "X", "X", "O",
                              "X", "O", "X"])).

its_a_draw_test() ->
  ?assertMatch(no_winner, oxo:winner(["O", "O", "X",
                                       "X", "X", "O",
                                       "O", "O", "X"])).

in_the_balance_1_test() ->
  ?assertMatch(no_winner, oxo:winner(["X", "O", "X",
                                           "X", "X", "O",
                                           "O", "O", " "])).

in_the_balance_2_test() ->
  ?assertMatch(no_winner, oxo:winner([" ", " ", " ",
                                           " ", " ", " ",
                                           " ", " ", " "])).
