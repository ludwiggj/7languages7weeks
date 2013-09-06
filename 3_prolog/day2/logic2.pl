valid_name((FirstName, Surname)) :-
  FirstNameRange = [george,john,susan],
  SurnameRange = [howarth,ludwig,rampling],
  member(FirstName, FirstNameRange),
  member(Surname, SurnameRange),
  %rule 1
  ( FirstName = susan
  -> Surname = howarth
  ; \+(Surname = howarth)),
  %rule 2
  ( FirstName = george
  -> \+(Surname = ludwig)
  ; true).
