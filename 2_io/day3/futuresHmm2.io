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

Bed := Object clone do (
   sleep := method(person,
	sleepTime := Random value(0, 2)
        #person talk("is about to sleep for " .. sleepTime .. " seconds")
	#if (sleepTime > 2, person talk("is yielding");yield,person talk("now sleeping"))
        if (sleepTime > 1, yield)
	wait(sleepTime)
	sleepTime
   )
)

Worshipper := Object clone do (
   id := "Default"
   name := "Default"
   setId := method(newId,
	id = newId
	name = "Disciple_" .. id
        sleep
   )
   talk := method(words,
	("[" .. name .. "] " .. words) println
   )
   sleep := method(
        sleepTime := Bed @sleep(self)
        #talk("is feeling sleepy")
        msg := "I have just slept for " .. sleepTime .. " seconds"
   )
   seekGuidance := method(
	yield
#sleepCount := Random value(1, 20) floor
#	talk("Oh, great Oracle, what do you say?....[" .. sleepCount .."]")
	talk("Oh, great Oracle, what do you say?....")
	#for (i, 1, sleepCount,
          #sleep
        #)
  	prediction := Oracle @at(id)
        #talk("is waiting....")
	#for (i, 1, Random value(1, 3),
        #  sleep
        #)


	wait(Random value(0, 15))
 	talk("Your proclamation \"" .. prediction .. "\" is most wise. I am your humble servant.")
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
