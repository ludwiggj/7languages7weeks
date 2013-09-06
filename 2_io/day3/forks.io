forks := List clone do (
  setSize(5)

  # atPutPlus is as atPut but can handle negative indexes
  List atPutOriginal := List getSlot("atPut")
  atPutPlus := method(index, anObject,
	if (index < 0, index = index + size)
	atPutOriginal(index, anObject)
	true
  )
)

forks asString
#forks atPutPlus(-1, 0)
result := forks @atPutPlus(-2, 0)
result = result and true
forks asString
