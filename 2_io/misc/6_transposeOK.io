TwoDList := Object clone #do (

TwoDList dimX := 0
TwoDList dimY := 0
TwoDList yList := list()

TwoDList dim := method(x, y, 
                dimX = x;
                dimY = y;
                yList setSize(dimY);
                for(i, 0, (yList size - 1), yList atPut(i, list() setSize(dimX)))
)

TwoDList set := method(x, y, value,
                rangeCheck(x, y);
                yList at(y) atPut(x, value)
)

TwoDList get := method(x, y,
                rangeCheck(x, y);
                yList at(y) at(x)
)

TwoDList rangeCheck := method(x, y,
                if ((x > dimX-1), Exception raise("first index must be in range 0 .. " .. (dimX - 1)));
                if ((y > dimY-1), Exception raise("second index must be in range 0 .. " .. (dimY - 1)));
)

TwoDList contents := (TwoDList getSlot("yList")) println

TwoDList transpose := method(
                transposedTwoDlist := TwoDList clone;
                transposedTwoDlist yList := list();
                transposedTwoDlist dim(dimY, dimX);
                for(y, 0, (dimY - 1),
                  for(x, 0, (dimX - 1),
                    transposedTwoDlist set(y, x, get(x, y)); 
                  )
                )
                ("Original => " .. contents) println;
                ("Transposed => " .. (transposedTwoDlist slotSummary)) println;
                return transposedTwoDlist;
)
#)

doFile("6_transpose_ex1.io")
