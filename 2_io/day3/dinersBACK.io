forks := List clone do (
  init := method(numberOfDiners,
	setSize(numberOfDiners)
  )

  # take is as atPut but can handle negative indexes
  List atPutOriginal := List getSlot("atPut")
  take := method(philosopher, index, anObject,
	if (index < 0, index = index + size)
	if (at(index) == nil,
		atPutOriginal(index, anObject)
		true,
		false
	)
  )

  release := method(index,
	if (index < 0, index = index + size)
	atPutOriginal(index, nil)
	true
  )
)

Philosopher := Object clone do (
   init := method(id,
	self name := id
	self numberOfMeals := 0
	self appetite := 25
	self gotFork := false
   )

   pickForkUp := method(index,
	forks asString println
	gotFork = false
	while (gotFork == false,
		gotFork = forks @take(self, index, name)
		gotFork = gotFork and true			# Dummy statement to force yield
		wait(Random value(0, 0.5))
	)
   )

   putForkDown := method(index,
	forks release(index)
	wait(Random value(0, 0.5))
	forks asString println
   )

   eat := method(
	forks asString println
	(name .. " is eating") println
	wait(Random value(0, 3))
	numberOfMeals = numberOfMeals + 1
   )

   dine := method(
	while (numberOfMeals < appetite,
		wait(Random value(0, 2))
		pickForkUp(name - 1)		# Get left fork
		pickForkUp(name)		# Get right fork
		eat
		putForkDown(name - 1)		# Release left fork
		putForkDown(name)		# Release right fork
	)
   )
)

numberOfPhilosophers := 4

forks init(numberOfPhilosophers)

for (i, 0, numberOfPhilosophers,
   diner := (Philosopher clone) do (
	init(i)
        @@dine
   )
)
Coroutine currentCoroutine pause
