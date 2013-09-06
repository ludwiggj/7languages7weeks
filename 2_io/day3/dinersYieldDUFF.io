forks := List clone do (
  setSize(5)

  # take is as atPut but can handle negative indexes
  List atPutOriginal := List getSlot("atPut")
  take := method(philosopher, index, anObject,
	if (index < 0, index = index + size)
	while (at(index) != nil, philosopher yield)
	atPutOriginal(index, anObject)
	true
  )

  putDown := method(index, anObject,
	if (index < 0, index = index + size)
	atPutOriginal(index, anObject)
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

   eat := method(
	(name .. " is eating") println
	wait(Random value(0, 3))
	numberOfMeals = numberOfMeals + 1
   )

   dine := method(
	while (numberOfMeals < appetite,
wait(Random value(0, 2))
		forks asString println
		gotFork = forks @take(self, name - 1, name)	# Get left fork
		gotFork = gotFork and true
		wait(Random value(0, 0.5))
		
		forks asString println
		gotFork = forks @take(self, name, name)		# Get right fork
		gotFork = gotFork and true
		wait(Random value(0, 0.5))
		
		forks asString println
		eat
		gotFork = forks @putDown(name - 1, nil)		# Release left fork
		gotFork = gotFork and true
		forks asString println

		gotFork = forks @putDown(name, nil)		# Release right fork
		gotFork = gotFork and true
	)
   )
)

for (i, 0, 4,
   diner := (Philosopher clone) do (
	init(i)
        @@dine
   )
   
)
Coroutine currentCoroutine pause
