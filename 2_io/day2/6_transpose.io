Matrix := List clone do (

	colSize := 0

	dim := method(col, row, 
                newMatrix := Matrix clone;
                newMatrix colSize = col;
                newMatrix setSize(row);
                newMatrix foreach(i, v, newMatrix atPut(i, list() setSize(col)));
                return newMatrix;
	)

        initialiseFromList := method(inputList, 
                newMatrix := Matrix clone;
                newMatrix colSize = (inputList at(0)) size;
                newMatrix setSize(inputList size);
                newMatrix foreach(i, v, newMatrix atPut(i, list() setSize(newMatrix colSize)));

		inputList foreach(row, elemRow,
        		elemRow foreach(col, elemCol,
        			newMatrix set(col, row, elemCol)
			)
		)
                return newMatrix;
	)

	set := method(col, row, value,
                rangeCheck(col, row);
                at(row) atPut(col, value)
	)

	get := method(col, row,
                rangeCheck(col, row);
                at(row) at(col)
	)

	rangeCheck := method(col, row,
                if ((col > colSize-1), Exception raise("col index must be in range 0 .. " .. (colSize - 1)));
                if ((row > size-1), Exception raise("row index must be in range 0 .. " .. (size - 1)));
	)

	transpose := method(
                transposedMatrix := Matrix dim(size, colSize);
                foreach(row, elemRow,
                  elemRow foreach(col, elemCol,
                    transposedMatrix set(row, col, get(col, row)); 
                  )
                )
                return transposedMatrix;
	)
)
