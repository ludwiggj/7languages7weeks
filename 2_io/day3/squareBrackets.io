# l := [1,2,3,4,5]

#Exception: Object does not respond to 'squareBrackets'
#  ---------
#  Object squareBrackets                squareBrackets.io 1


Object squareBrackets := method(
  #simply return the *list* of arguments passed in
  call message arguments
  )

l := [1,2+3,3,4,5-7]
l type println    # => list
l at(1) println

l[1] println      # => delegated to Object

#define a square brackets index syntax on lists
List squareBrackets := method(index,
  self at(index)
  )
l[1] println
