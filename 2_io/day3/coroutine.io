a := Object clone
a talk := method(
	yield
	"One Fish" println
	yield
	"Red Fish" println
	yield
)

b := Object clone
b talk := method(
	yield
	"Two Fish" println
	yield
	"Blue Fish" println
	yield
)

b @@talk; a @@talk

Coroutine currentCoroutine pause
