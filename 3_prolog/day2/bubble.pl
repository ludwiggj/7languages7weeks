bubblesort(L, L1) :-
        (   bubble(L, L2)
        ->  bubblesort(L2, L1)
        ;   L = L1 ).

bubble([A, B|T], L) :-
        (   A > B
        ->  L = [B, A|T]
        ;   L = [A | L1],
            bubble([B|T], L1)).
