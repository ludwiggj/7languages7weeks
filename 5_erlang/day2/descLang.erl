-module(descLang).

-export([descLang/2]).

%descLang(_, _) -> [B || {_,B} <- lists:keyfind(erlang, 1, [{erlang, "a functional language"}, {ruby, "an OO language"}])].

descLang(List, Key) -> {_, Value} = lists:keyfind(Key, 1, List), Value.

% Languages = [{erlang, "a functional language"}, {ruby, "an OO language"}].
% descLang:descLang(Languages, erlang).
