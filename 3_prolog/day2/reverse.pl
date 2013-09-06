%my_reverse([Head|[]], Head).
%my_reverse([[]|Tail], [Tail]).
%my_reverse([Head|[Head1|[]]], [Head1, Head]).
%my_reverse([Head|[Head1|[Head2|[]]]], [Head2, Head1, Head]).
%my_reverse_0([Head|Tail1], append(Tail2, Head, X)) :- my_reverse(Tail1, Tail2).


my_reverse0([],[]).
my_reverse0([Head|Tail1], [Tail2|Head]) :- my_reverse0(Tail1, Tail2).

%my_reverse00([],[]).
%my_reverse00([Head|Tail1], Result) :- my_reverse00(Tail1, Tail2),
%                                      append(Tail2, [Head], Result).

%my_reverse00([1|2, 3], Result) :-  my_reverse00([2,3], Tail2),
%                                   append(Tail2, [1], Result).

%my_reverse00([2|3], Result) :-  my_reverse00([3], Tail2),
%                                   append(Tail2, [2], Result).

%my_reverse00([3|[]], Result) :-  my_reverse00([], Tail2),
%                                   append(Tail2, [3], Result).

my_reverse2([Head|Tail], D, Reversed) :- my_reverse2(Tail, [Head|D], Reversed).
my_reverse2([], X, X).
