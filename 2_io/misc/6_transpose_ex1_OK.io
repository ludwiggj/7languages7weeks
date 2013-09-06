#       T
# [1, 2]  = [1]
#           [2]

twoDlist := TwoDList clone
twoDlist dim(1,2)
twoDlist set(0,0,1)
twoDlist set(0,1,2)
twoDlist get(0,0) println
twoDlist get(0,1) println
#">>>>" .. (twoDlist contents) println

#transposedTwoDlist := TwoDList clone
#transposedTwoDlist yList := list()
#twoDlist transpose(transposedTwoDlist)

("End" .. (twoDlist transpose contents)) println

