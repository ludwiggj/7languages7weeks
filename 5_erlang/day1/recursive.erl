-module(recursive).

-export([factorial/1]).
-export([fib/1]).
-export([wordcount/1]).
-export([countTo10/1]).

factorial(0) -> 1;
factorial(N) -> N * factorial(N-1).

fib(0) -> 1;
fib(1) -> 1;
fib(N) -> fib(N-1) + fib(N-2).

wordcount([32 | Rest]) -> wordcount(Rest);
wordcount([_, 32 | Rest]) -> 1 + wordcount(Rest);
wordcount([_ | []]) -> 1;
wordcount([_ | Rest]) -> wordcount(Rest);
wordcount([]) -> 0.

countTo10(N) -> if
                  N < 10  -> io:write(N), io:nl(), countTo10(N+1);
                  N == 10 -> io:format("~w~n", [N]);
                  true    -> io:format("Number must be smaller than 10! You entered ~w.~n", [N])
                end.
