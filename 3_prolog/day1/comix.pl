author('Tale Of One Bad Rat', 'Bryan Talbot').
author('Luther Arkwright', 'Bryan Talbot').
author('Grandville', 'Bryan Talbot').
author('Maus', 'Art Spiegelman').
author('Blankets', 'Craig Thomson').
author('Carnet de Voyage', 'Craig Thomson').

authored(X, Y) :- author(Y, X).

% authored('Bryan Talbot', Book)
% authored(Author, Book)
