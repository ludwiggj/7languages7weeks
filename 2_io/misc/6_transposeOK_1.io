Matrix := Object clone do (

secondDimSize := 0

dim := method(x, y, 
                newMatrix := Matrix clone;
                newMatrix secondDimSize = x;
                newMatrix yList := list()
                (newMatrix yList) setSize(y);
                for(i, 0, y - 1, newMatrix yList atPut(i, list() setSize(x)));
                return newMatrix;
)

set := method(x, y, value,
                rangeCheck(x, y);
                yList at(y) atPut(x, value)
)

get := method(x, y,
                rangeCheck(x, y);
                yList at(y) at(x)
)

rangeCheck := method(x, y,
                if ((x > secondDimSize), Exception raise("first index must be in range 0 .. " .. (secondDimSize - 1)));
                if ((y > (yList size)-1), Exception raise("second index must be in range 0 .. " .. ((yList size) - 1)));
)

contents := (getSlot("yList")) println

transpose := method(
                #transposedMatrix := Matrix clone;
                #transposedMatrix yList := list();
                transposedMatrix := Matrix dim((yList size), secondDimSize);
("y dim [" .. (yList size) .. "] x dim [" .. secondDimSize .. "]") println
                for(y, 0, ((yList size) - 1),
                  for(x, 0, (secondDimSize - 1),
("x [" .. x .. "] y [" .. y .. "]") println
                    transposedMatrix set(y, x, get(x, y)); 
                  )
                )
#                ("Original => " .. contents) println;
#                ("Transposed => " .. (transposedMatrix slotSummary)) println;
                return transposedMatrix;
)
)

doFile("6_transpose_ex1.io")
