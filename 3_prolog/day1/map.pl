different(red,green).
different(red,blue).
different(green,red).
different(green,blue).
different(blue,red).
different(blue,green).

colouring(Alabama, Mississippi, Georgia, Tennessee, Florida) :-
  different(Mississippi,Tennessee),
  different(Mississippi,Alabama),
  different(Alabama,Tennessee),
  %different(Alabama,Mississippi),
  different(Alabama,Georgia),
  different(Alabama,Florida),
  different(Georgia,Florida),
  different(Georgia,Tennessee).
  %different(Georgia,Alabama).

%  Alabama, Mississippi, Georgia, Tennessee, Florida
%1.   b          g         r         r         g
%2.   g          b         r         r         b
%3.   b          r         g         g         r
%4.   r          b         g         g         b
%5.   g          r         b         b         r
%6.   r          g         b         b         g

