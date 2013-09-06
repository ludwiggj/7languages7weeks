plays('Dave Brubeck', piano).
plays('John Coltrane', saxophone).
plays('Matt Bellamy', guitar).
plays('Matt Bellamy', piano).
plays('Jimi Hendrix', guitar).
plays('Tom Morello', guitar).

style('Dave Brubeck', jazz).
style('John Coltrane', jazz).
style('Matt Bellamy', rock).
style('Jimi Hendrix', rock).
style('Tom Morello', rock).

used_in_genre(Instrument, Genre) :- plays(X, Instrument), style(X, Genre).

same_genre(Instr1, Instr2, Genre) :- used_in_genre(Instr1, Genre), used_in_genre(Instr2, Genre), \+(Instr1 = Instr2).

%gprolog --query-goal "[music], same_genre(Instr1, Instr2, rock)"
%used_in_genre(What, rock).

%setof(Instr, used_in_genre(Instr, rock), List).

/*
 * The following will output all musicians that play 'guitar'
 *
 * plays(Who, 'guitar').
 *
 */

% | ?- used_in_genre(What, rock).
/*
I get the following output:

What = guitar ? ;

What = piano ? ;

What = guitar ? ;

What = guitar

(4 ms) yes*/
