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

  atWithDelay := method( index, delay,	      
	wait(delay)
        at(index)
  }
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
   delay1 := list(0.1, 0.2, 0.3, 0.4, 0.5)
   delay2 := list(5, 4, 3, 2, 1)
   seekGuidance := method(
        wait(delay1 at(id))
	talk("[" .. delay1 at(id) .. "] Oh, great Oracle, what do you say?....")
	if (id != 4,
  		prediction := Oracle @atWithDelay(id, delay2 at(id)),
		delay2 insertAt(0, id)
		prediction := Oracle @@atWithDelay(id, delay2 at(id))
	)
 	talk("[" .. delay2 at(id) .. "] Your proclamation \"" .. prediction .. "\" is most wise. I am your humble servant.")
        wait(15)
        talk("My delays were [" .. delay1 at(id) .. "] and [" .. delay2 at(id) .. "] Totalling [" .. (delay1 at(id) + delay2 at(id)) .. "]")
   )
)

Oracle initialise
for (i, 0, 4,
   worshipper := (Worshipper clone) do (
	setId(i)
   )
   worshipper @@seekGuidance
)
Coroutine currentCoroutine pause
