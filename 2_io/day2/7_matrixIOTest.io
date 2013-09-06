doFile("6_transpose.io")

MatrixPersistanceTest := UnitTest clone do (
	matrix ::= Matrix dim(2,3) do (
			set(0,0,1)
			set(0,1,3)
			set(0,2,5)
			set(1,0,2)
			set(1,1,4)
			set(1,2,6)

	)

	testMatrixPersist := method(
		("Original => " .. matrix) println;

		# serialize matrix to file
		File with("Matrix.data") open write(matrix serialized) close

		reconsitutedMatrix := Matrix initialiseFromList(doRelativeFile("Matrix.data"))

		("Reconsituted => " .. reconsitutedMatrix) println;
	
		assertTrue(reconsitutedMatrix isNotEmpty)

		matrix foreach(row, elemRow,
        		elemRow foreach(col, elemCol,
        			matrixElem := matrix get(col, row);
				reconsitutedMatrixElem := reconsitutedMatrix get(col, row);
				("matrix (" .. col .. "," .. row .. ") == reconsitutedMatrix (" .. col .. "," .. row .. ") ? " .. "[" .. matrixElem .. " == " ..
					reconsitutedMatrixElem .. "] == " .. (matrixElem == reconsitutedMatrixElem)) println;
				assertEquals(matrixElem, reconsitutedMatrixElem)
			)
		)
	)
)

MatrixPersistanceTest run
