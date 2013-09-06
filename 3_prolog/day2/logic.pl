firstName(john).
firstName(susan).
firstName(george).
surname(ludwig).
surname(howarth).
surname(rampling).

fullName(FirstName, Surname) :- firstName(FirstName), surname(Surname).

candidateName(FirstName, Surname) :- fullName(FirstName, Surname),
                                     %rule 1
                                     ( FirstName = susan
                                     -> Surname = howarth
                                     ; \+(Surname = howarth)),
                                     %rule 2
                                     ( FirstName = george
                                     -> \+(Surname = ludwig)
                                     ; true).
