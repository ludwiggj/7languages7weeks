TwoDList := Object clone
TwoDList dimX := 0
TwoDList dimY := 0
TwoDList yList := List clone

TwoDList dim := method(x, y, dimX = x; dimY = y;
                yList setSize(dimY);
                for(i, 0, (yList size - 1), yList atPut(i, List clone setSize(dimX)))
)

TwoDList set := method(x, y, value,
                #rangeCheck(x, y);
                yList at(y) atPut(x, value)
)

TwoDList get := method(x, y,
                #rangeCheck(x, y);
                yList at(y) at(x)
)

TwoDList rangeCheck := method(x, y,
                if ((x > dimX-1), Exception raise("first index must be in range 0 .. " .. (dimX - 1)));
                if ((y > dimY-1), Exception raise("second index must be in range 0 .. " .. (dimY - 1)));
)

TwoDList contents := TwoDList getSlot("yList")

twoDlist := TwoDList clone
twoDlist dim(2,1)
twoDlist set(5,0,1)
twoDlist set(1,0,2)
