squareBrackets := method(call evalArgs)
curlyBrackets := method(call evalArgs)
#squareBrackets := method(call message arguments map(x, do Message(x)))

[1,2,11+7,3] println
[1,2,[5,6-4],3] println

{1, 2, 3} println
{1, {1+2, {1+2+3, {1+2+3+5, {1+2+3+5+8}}}}} println
