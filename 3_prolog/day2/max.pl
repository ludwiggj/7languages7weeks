max([], 0).
max([Head|[]], Head).
max([Head|Tail], Max) :- max(Tail, PrevMax),
                         ((Head > PrevMax) -> Max = Head ; Max = PrevMax).
