-module(dayTwo).

-export([animal1/1]).
-export([animal2/1]).
-export([term/1]).
-export([nums/1]).
-export([inc/1]).
-export([filter/2]).
-export([sum/1]).
-export([double_all/1]).
-export([double_all2/1]).

animal1(Animal) -> case Animal of
                    "dog" -> underdog;
                    "cat" -> miaow;
                    Anything -> not_a_dog_nor_a_cat
                   end.

animal2(Animal) -> case Animal of
                    "elephant" -> dumbo;
                    _          -> unknown
                   end.

term(X) -> if
             X > 0 -> positive;
             X < 0 -> negative;
             true  -> 0
           end.

nums(Numbers) -> Print = fun(Number) -> io:format("~p~n", [Number]) end,
                 lists:foreach(Print, Numbers).

inc(Numbers) -> lists:map(fun(Number) -> Number+1 end, Numbers).

filter(Criteria, Numbers) -> lists:filter(Criteria, Numbers).

sum(Numbers) -> Adder = fun(ListItem, SumSoFar) -> ListItem + SumSoFar end,
                InitialSum = 0,
                lists:foldl(Adder, InitialSum, Numbers).

double_all([]) -> [];
double_all([F|R]) -> [F + F|double_all(R)].

double_all2(List) -> Double = fun(X) -> X*2 end,
                     [Double(X) || X <- List].
