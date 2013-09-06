Echo := Object clone do (

who := method(
  call sender type println   # => caller
  call message name println  # => who
  call target type println   # => Echo
  )

howmany := method(
  args := call message arguments
  (args size asString .. " arguments passed in.") println
  args foreach(arg,
    arg println
    )
  )

context := method(
  call message type println
  ("Message [" .. call message asSimpleString .. "]") println
  ("Message + 2 [" .. call message next next asSimpleString .. "]") println
  ("Message + 3 [" .. call message next next next asSimpleString .. "]") println
  ("Message + 4 [" .. call message next next next next asSimpleString .. "]") println
  ("Message + 5 [" .. call message next next next next next asSimpleString .. "]") println
  )
)

Echo context
Echo who
Echo howmany("we", "can", "send", list(3,4,5,6,100), "many", "args")
Echo howmany("or", "justafew")
