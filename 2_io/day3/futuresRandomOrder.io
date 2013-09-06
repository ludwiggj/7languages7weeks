Oracle := List clone do (
   initialise := method(
	append("The future is Orange")
	append("You will be happy")
	append("The future's so bright, I gotta wear shades")
	append("You will die tomorrow")
	append("You will win the lottery")
	append("You will become a COBOL programmer")
	append("You will marry a princess in a far off land")
	append("Sorry, don't know, my spidey sense isn't working very well today")
	append("You need to cross my palm with silver first")
	append("You'll elope with an antelope")
   )
)

Worshipper := Object clone do (
   id := "Default"
   name := "Default"
   setId := method(newId,
	id = newId
	name = "Disciple_" .. id
   )
   talk := method(words,
	("[" .. name .. "] " .. words) println
   )
   seekGuidance := method(
        delay1 := Random value(0, 3) 
        wait(delay1)
	talk("[" .. delay1 .. "] Oh, great Oracle, what do you say?....")
  	prediction := Oracle @at(id)
        delay2 := Random value(0, 5) 
	wait(delay2)
 	talk("[" .. delay2 .. "] Your proclamation \"" .. prediction .. "\" is most wise. I am your humble servant.")
        wait(10)
        talk("My delays were [" .. delay1 .. "] and [" .. delay2 .. "] Totalling [" .. (delay1 + delay2) .. "]")
   )
)

Oracle initialise
for (i, 1, 5,
   worshipper := (Worshipper clone) do (
	setId(i)
   )
   worshipper @@seekGuidance
)
Coroutine currentCoroutine pause
