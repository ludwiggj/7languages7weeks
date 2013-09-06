Waiter := Object clone do (
  init := method(numberOfDiners,
	self forks := List clone do
	forks setSize(numberOfDiners)
	self forksFree := numberOfDiners
  )

  # take is as atPut but can handle negative indexes
  List atPutOriginal := List getSlot("atPut")
  getFork := method(index, requestor,
	if (index < 0, index = index + forks size)
	if (forks at(index) == nil,
		forks atPutOriginal(index, requestor)
		forksFree = forksFree - 1
		true,
		false
	)
  )

  returnFork := method(index,
	if (index < 0, index = index + forks size)
	forks atPutOriginal(index, nil)
	forksFree = forksFree + 1
	true
  )
  
  report := method(
    (forks asString .. " => [" .. forksFree .. "] free") println
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
	Waiter report
	gotFork = false
	while (gotFork == false,
		gotFork = Waiter @getFork(index, name)
		gotFork = gotFork and true			# Dummy statement to force yield
		wait(Random value(0, 0.5))
	)
   )

   putForkDown := method(index,
	Waiter returnFork(index)
	wait(Random value(0, 0.5))
	Waiter report
   )

   eat := method(
	Waiter report
	numberOfMeals = numberOfMeals + 1
	(name .. " is eating meal number " .. numberOfMeals .. " of " .. appetite) println
	wait(Random value(0, 1))	
   )

   dine := method(
	while (numberOfMeals < appetite,
#		wait(Random value(0, 2))
		pickForkUp(name - 1)		# Get left fork
		pickForkUp(name)		# Get right fork
		eat
		putForkDown(name - 1)		# Release left fork
		putForkDown(name)		# Release right fork
	)
   )
)

numberOfPhilosophers := 5

Waiter init(numberOfPhilosophers)

for (i, 0, numberOfPhilosophers - 1,
   diner := (Philosopher clone) do (
	init(i)
        @@dine
   )
)
Coroutine currentCoroutine pause
