step := 6
counter := -step
spacer := method(arg,
	arg repeat(do write(" "))
)

Builder := Object clone do (
	forward := method(
		counter = counter + step
		spacer(counter)
		writeln("<", call message name, ">")
		call message arguments foreach(
			arg,
			content := self doMessage(arg)
			if (content type == "Sequence",
				spacer(counter + step)
				writeln(content)				
			)
		)
		spacer(counter)
		writeln("</", call message name, ">")
		counter = counter - step
	)
)

Builder ul(
	li(li("Io")),
	li("Lua"),
	li("Javascript"))

