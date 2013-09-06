trait Nice {
  def greet() = println("Hello sailor!")
}

class Person(val name: String) {
  def talk(message: String) = println(name + " says " + message)
  def id(): String = name
}

class Employee(override val name: String,
                        val number: Int) extends Person(name) {
  override def talk(message: String) = println(name + " with number " + number + " says " + message)
  override def id(): String = number.toString
}

class Employee1(override val name: String,
                override val number: Int) extends Employee(name, number) {
  override def talk(message: String) = println(name + " with number " + number + " says " + message)
  override def id(): String = number.toString
}

class Character(override val name: String) extends Person(name) with Nice
//class Character(override val blah: String) extends Person(blah) with Nice

var bob = new Person("Bob")
println(bob.id)
println(bob.name)

var employee = new Employee("Yoda", 4)
employee.talk("hmmmmmm")

val flanders = new Character("Ned")
flanders.greet

var employee1 = new Employee("Yoda", 4)
employee1.talk("hurrrrrr")

