min([], 0).
min([Head|[]], Head).
min([Head|Tail], Min) :- min(Tail, PrevMin),
                         ((Head < PrevMin)
                           -> Min = Head ; Min = PrevMin).
