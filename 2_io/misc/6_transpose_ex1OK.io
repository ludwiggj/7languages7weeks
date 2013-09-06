"       T" println
" [1, 2]  = [1]" println
"           [2]" println
" " println

twoDlist := TwoDList clone
twoDlist dim(2,1)
twoDlist set(0,0,1)
twoDlist set(1,0,2)
transposed := twoDlist transpose

cell_0_0 := twoDlist get(0,0)
cell_1_0 := twoDlist get(1,0)
transposed_cell_0_0 := transposed get(0,0)
transposed_cell_0_1 := transposed get(0,1)

("twoDlist get(0,0) == transposed get(0,0) ? [" .. cell_0_0 .. " == " .. transposed_cell_0_0 .. "] == " .. (cell_0_0 == transposed_cell_0_0)) println;
("twoDlist get(1,0) == transposed get(0,1) ? [" .. cell_1_0 .. " == " .. transposed_cell_0_1 .. "] == " .. (cell_1_0 == transposed_cell_0_1)) println;
" " println

"       T" println
" [1, 2]  = [1, 3]" println
" [3, 4]    [2, 4]" println
" " println

twoDlist := TwoDList clone
twoDlist dim(2,2)
twoDlist set(0,0,1)
twoDlist set(0,1,3)
twoDlist set(1,0,2)
twoDlist set(1,1,4)
transposed := twoDlist transpose

cell_0_0 := twoDlist get(0,0)
cell_1_0 := twoDlist get(1,0)
cell_0_1 := twoDlist get(0,1)
cell_1_1 := twoDlist get(1,1)
transposed_cell_0_0 := transposed get(0,0)
transposed_cell_0_1 := transposed get(0,1)
transposed_cell_1_0 := transposed get(1,0)
transposed_cell_1_1 := transposed get(1,1)

("twoDlist get(0,0) == transposed get(0,0) ? [" .. cell_0_0 .. " == " .. transposed_cell_0_0 .. "] == " .. (cell_0_0 == transposed_cell_0_0)) println;
("twoDlist get(1,0) == transposed get(0,1) ? [" .. cell_1_0 .. " == " .. transposed_cell_0_1 .. "] == " .. (cell_1_0 == transposed_cell_0_1)) println;
("twoDlist get(0,1) == transposed get(1,0) ? [" .. cell_0_1 .. " == " .. transposed_cell_1_0 .. "] == " .. (cell_0_1 == transposed_cell_1_0)) println;
("twoDlist get(1,1) == transposed get(1,1) ? [" .. cell_1_1 .. " == " .. transposed_cell_1_1 .. "] == " .. (cell_1_1 == transposed_cell_1_1)) println;
" " println

"       T" println
" [1, 2]  = [1, 3, 5]" println
" [3, 4]    [2, 4, 6]" println
" [5, 6]" println
" " println
twoDlist := TwoDList clone
twoDlist dim(2,3)
twoDlist set(0,0,1)
twoDlist set(0,1,3)
twoDlist set(0,2,5)
twoDlist set(1,0,2)
twoDlist set(1,1,4)
twoDlist set(1,2,6)
transposed := twoDlist transpose

cell_0_0 := twoDlist get(0,0)
cell_1_0 := twoDlist get(1,0)
cell_0_1 := twoDlist get(0,1)
cell_1_1 := twoDlist get(1,1)
cell_0_2 := twoDlist get(0,2)
cell_1_2 := twoDlist get(1,2)
transposed_cell_0_0 := transposed get(0,0)
transposed_cell_0_1 := transposed get(0,1)
transposed_cell_1_0 := transposed get(1,0)
transposed_cell_1_1 := transposed get(1,1)
transposed_cell_2_0 := transposed get(2,0)
transposed_cell_2_1 := transposed get(2,1)

("twoDlist get(0,0) == transposed get(0,0) ? [" .. cell_0_0 .. " == " .. transposed_cell_0_0 .. "] == " .. (cell_0_0 == transposed_cell_0_0)) println;
("twoDlist get(1,0) == transposed get(0,1) ? [" .. cell_1_0 .. " == " .. transposed_cell_0_1 .. "] == " .. (cell_1_0 == transposed_cell_0_1)) println;
("twoDlist get(0,1) == transposed get(1,0) ? [" .. cell_0_1 .. " == " .. transposed_cell_1_0 .. "] == " .. (cell_0_1 == transposed_cell_1_0)) println;
("twoDlist get(1,1) == transposed get(1,1) ? [" .. cell_1_1 .. " == " .. transposed_cell_1_1 .. "] == " .. (cell_1_1 == transposed_cell_1_1)) println;
("twoDlist get(0,2) == transposed get(2,0) ? [" .. cell_0_2 .. " == " .. transposed_cell_2_0 .. "] == " .. (cell_0_2 == transposed_cell_2_0)) println;
("twoDlist get(1,2) == transposed get(2,1) ? [" .. cell_1_2 .. " == " .. transposed_cell_2_1 .. "] == " .. (cell_1_2 == transposed_cell_2_1)) println;
" " println
