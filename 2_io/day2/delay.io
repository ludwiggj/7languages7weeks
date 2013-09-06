Delay := Object clone
Delay send := method(
  args := call message arguments
  for(i,0, args size - 1, 2,
    delay := doMessage(args at(i)) #do message turns the unevaluated '2' message into a '2' number
    msg := args at(i+1)

    System sleep(delay)
    msg doInContext(call sender) #thought i'd be able to do 'call sender msg' but that does not work
    )
  )


Me := Object clone
Date now asString("%H:%M:%S") println
Me time := method(at, ("Hello There! the time is " .. at asString("%H:%M:%S")) println)
Me delayMsgs := method(Delay send(1, time(Date now),
                                  3, time(Date now),
                                  5, time(Date now)))

Me delayMsgs
