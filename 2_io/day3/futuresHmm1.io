Oracle := Object clone do (

isIn := true

Oracle isIn := method(
  writeln("The Oracle is IN")
#  yield
#  while (isIn == true, yield)
)

Oracle isOut := method(
  writeln("The Oracle is OUT")
  isIn = false
)

Oracle proclamations := list("The future is Orange",
	"You will be happy",
	"The future's so bright, I gotta wear shades",
	"You will die tomorrow",
	"You will win the lottery",
	"You will become a COBOL programmer",
	"You will marry a princess in a far off land",
	"Sorry, don't know, my spidey sense isn't working very well today",
	"You need to cross my palm with silver first",
	"You'll elope with an antelope")

Oracle tellMe := method(id,
#  yield
  sleepTime := self @sleep(id)
  writeln("[" .. id .. "] " .. " slept for " .. sleepTime .. " seconds")
#  writeln("[" .. id .. "] " .. " slept for " .. @sleep(id) .. " seconds")
#  writeln("[" .. id .. "] " .. " slept for " .. @sleep(id) .. " seconds")

  return proclamations at(id)
)

Oracle sleep := method(id,
"Hey" println
  sleepTime := Random value(5) floor
  wait(sleepTime)
  return sleepTime
)

Worshipper := Object clone
Worshipper seekGuidance := method(
  id := Random value(10) floor
#  id type println
#  0 type println
  speech := "[" .. id .. "] " .. "Oh, great Oracle, what do you say?...."
  writeln(speech)
  prediction := Oracle @tellMe(id)
  speech = "[" .. id .. "] " .. "I am waiting...."
  writeln(speech)
  speech = "[" .. id .. "] " .. "Your proclamation \"" .. prediction .. "\" is most wise. I am your humble servant."
  writeln(speech)
)

#Oracle @@isIn
worshipper1 := Worshipper clone
worshipper2 := Worshipper clone

worshipper1 @@seekGuidance; worshipper2 @@seekGuidance
#Oracle isOut
Coroutine currentCoroutine pause

