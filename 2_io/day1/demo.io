#!/usr/local/bin/IO
Smurf := Object clone
Smurf newSlot("colour", "blue")
Smurf setSlot("name", "Speccy")

Smurf introduceMyself := method("Hi, my name is " asMutable appendSeq (Smurf name) asMutable appendSeq (" the ") asMutable appendSeq (Smurf type) asMutable appendSeq (". I am ") asMutable appendSeq (Smurf colour) asMutable appendSeq ("."))

("Take 1 [" .. (Smurf introduceMyself) .. "]") println

Smurf name = "Smurfette"
("Take 2 [" .. (Smurf introduceMyself) .. "]") println

Sequence append := method(v, self asMutable appendSeq(v))
Smurf introduceMyselfQuickly := method("Hi, my name is " append (Smurf name) append (" the ") append (Smurf type) append (". I am ") append (Smurf colour) append ("."))
Smurf name = "Bluey"
("Take 3 [" .. (Smurf introduceMyself) .. "]") println

Smurf introduceMyselfQuickly := method("Hi, my name is " append (name) append (" the ") append (type) append (". I am ") append (colour) append ("."))
Smurf name = "Blue Tack"
("Take 4 [" .. (Smurf introduceMyself) .. "]") println

Smurf introduceMyselfQuickly := method("Hi, my name is " .. name .. " the " .. type .. ". I am " .. colour .. ".")
Smurf name = "Sky"
("Take 5 [" .. (Smurf introduceMyself) .. "]") println

Smurf introduceMyselfQuickly := method("Hi, my name is #{name} the #{type}. I am #{colour}.")
Smurf name = "Frozen"
("Take 6 [" .. (Smurf introduceMyself) .. "]") println

# NOTE: Actual definition of .. is as follows:
#
# Io> String getSlot("..")
# ==> # /home/ubuntu/Downloads/stevedekorte-io-92e1bf1/libs/iovm/io/B_Sequence.io:35
# method(arg, 
#    self asString cloneAppendSeq(arg asString)
# )
