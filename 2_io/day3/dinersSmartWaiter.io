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
	if ((forks at(index) == nil) and (forksFree > 1),
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
  
  ownsFork := method(index, name,
	(forks at(index)) == name
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
   )

   pickForkUp := method(index,
	#Waiter report
	success := false
	for (try, 1, 10,
		if (success not,
			success = Waiter @getFork(index, name)
			success = success and true,
			try = 11
		)
	)
	wait(Random value(0, 0.5))
	success
   )

   putForkDown := method(index,
	Waiter returnFork(index)
	wait(Random value(0, 0.5))
	#Waiter report
   )

   eat := method(
	#Waiter report
	if ((Waiter ownsFork(name, name) == true) and (Waiter ownsFork(name-1, name) == true),
 		numberOfMeals = numberOfMeals + 1
		(name .. " is eating meal number " .. numberOfMeals .. " of " .. appetite) println,
		wait(Random value(0, 1)),
		"NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO!" println
	)
   )

   dine := method(
	while (numberOfMeals < appetite,
		if (pickForkUp(name - 1),		# Get left fork
			if (pickForkUp(name),		# Get right fork
				eat
				putForkDown(name - 1)		# Release left fork
				putForkDown(name),		# Release right fork
				putForkDown(name - 1)
			)
		)		
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
