#serviceFinished := false

forks := List clone do (
  setSize(5)

  # take is as atPut but can handle negative indexes
  List atPutOriginal := List getSlot("atPut")
  take := method(philosopher, index, anObject,
	("philosopher [" .. philosopher name .. "] taking") println
	if (index < 0, index = index + size)
	while(at(index) != nil, yield)
	atPutOriginal(index, anObject)
	true
  )

  putDown := method(index, anObject,
	if (index < 0, index = index + size)
	atPutOriginal(index, anObject)
	true
  )

#  available := method(
#	while (serviceFinished == false,
#		yield
#		asString println
#		yield
#		wait(2)
#		yield
#	)
# )
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
wait(Random value(0, 1))
		gotFork = forks @take(self, name - 1, name)	# Get left fork
wait(Random value(0, 1))
(name .. " [" .. gotFork .. "]") println
forks asString println
		gotFork = forks @take(self, name, name)		# Get right fork
wait(Random value(0, 1))
(name .. " [" .. gotFork .. "]") println
		forks asString println
		eat
		gotFork = forks @putDown(name - 1, nil)		# Release left fork
wait(Random value(0, 1))
(name .. " [" .. gotFork .. "]") println
		gotFork = forks @putDown(name, nil)		# Release right fork
wait(Random value(0, 1))
(name .. " [" .. gotFork .. "]") println
	)
#	serviceFinished = true
   )

)

#forks available

for (i, 0, 4,
   diner := (Philosopher clone) do (
	init(i)
        @@dine
   )
   
)
#forks @@available
Coroutine currentCoroutine pause
