List myAverage := method(
  average := 0
  e := try(
    average = (self sum) / (self size)
  ) 

  e catch(Exception,
    Exception raise("list contains at least 1 element which isn't a number")
  )
  return average
)

list(1,2,3,4) myAverage println
list("bob", 2, 3) myAverage println


