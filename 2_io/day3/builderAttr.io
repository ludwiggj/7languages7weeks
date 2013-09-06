doFile("addOperator.io")

Map atPutAttr := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
		call evalArgAt(1)
	)
)

step := 6
counter := -step
spacer := method(arg,
	arg repeat(do write(" "))
)

Builder := Object clone do (
	forward := method(
		counter = counter + step
		
		spacer(counter)
		write("<", call message name)
		if (counter == 0, writeln(">"))
		call message arguments foreach(
			arg,

			content := self doMessage(arg)
			if (content type == "Map",
				content keys foreach(arg, write(" ", arg, "=\"", content at(arg), "\""))
			)
			if (content type == "Sequence",
				writeln(">")
				spacer(counter + step)
				writeln(content)				
			)
		)
		spacer(counter)
		writeln("</", call message name, ">")
		counter = counter - step
	)

	curlyBrackets := method(
		r := Map clone	
		call message arguments foreach(arg,
			r doMessage(arg)
		)
		r
	)
)

Builder book({"author" : "Harrison", "volume" : "2"}, "The Stainless Steel Rat Saves the World")

Builder ul(
	li("Io"),
	li("Lua"),
	book({"author" : "Harrison", "volume" : "2"}, "The Stainless Steel Rat Saves the World"),
	li("Javascript")
)
