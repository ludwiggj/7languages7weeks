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

/*
 * The following will output all musicians that play 'guitar'
 *
 * plays(Who, 'guitar').
 *
 */
