-module(msg).

-export([display/1]).

display({error, Message}) -> io:format("error: ~s~n", [Message]);
display(success)          -> io:format("Success!~n");
display(NotRecognised)    -> io:format("Command not recognised. You entered "),
                             if
                               is_list(NotRecognised) -> io:format("~s~n", [NotRecognised]);
                               true                   -> io:format("~w~n", [NotRecognised])
                             end.
