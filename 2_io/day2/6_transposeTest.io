doFile("6_transpose.io")

TransposeTest := UnitTest clone do (
	matrix ::= list()

	testTranspose := method(
		("Original => " .. matrix) println;
		transposedMatrix := matrix transpose
		("Transposed => " .. transposedMatrix) println;
	
		assertTrue(matrix isNotEmpty)

		matrix foreach(row, elemRow,
        		elemRow foreach(col, elemCol,
        			matrixElem := matrix get(col, row);
				transposedMatrixElem := transposedMatrix get(row, col);
				("matrix (" .. col .. "," .. row .. ") == transposedMatrix (" .. row .. "," .. col .. ") ? " .. "[" .. matrixElem .. " == " ..
					transposedMatrixElem .. "] == " .. (matrixElem == transposedMatrixElem)) println;
				assertEquals(matrixElem, transposedMatrixElem)
			)
		)
	)
)

"       T" println
" [1, 2]  = [1]" println
"           [2]" println
" " println

TransposeTest do(
	setMatrix(
		Matrix dim(2,1) do (
			set(0,0,1)
			set(1,0,2)
		)
	)
	run
)

"       T" println
" [1, 2]  = [1, 3]" println
" [3, 4]    [2, 4]" println
" " println

TransposeTest do (
	setMatrix(
		Matrix dim(2,2) do (
			set(0,0,1)
			set(0,1,3)
			set(1,0,2)
			set(1,1,4)
		)
	)
	run
)

"       T" println
" [1, 2]  = [1, 3, 5]" println
" [3, 4]    [2, 4, 6]" println
" [5, 6]" println
" " println

TransposeTest do (
	setMatrix(
		Matrix dim(2,3) do (
			set(0,0,1)
			set(0,1,3)
			set(0,2,5)
			set(1,0,2)
			set(1,1,4)
			set(1,2,6)
		)
	)
	run
)
