List myAverage := method(
  self foreach(i, if (i type != "Number", Exception raise("list contains at least 1 element which isn't a number")))
  return (self sum) / (self size) 
)

list(1,2,3,4) myAverage println
list("bob", 2, 3) myAverage println


