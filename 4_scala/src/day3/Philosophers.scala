package sevenlanguages.scala.daythree

import scala.actors._
import Actor._

class Philosopher(id:Int, noOfMeals:Int) extends Actor {
  def act() {
    receive {
      case "Eat" =>
        for (i <- 1 to noOfMeals) {
        println(id + " meal " + i + " yum!")
      }
    }
  }
}

object Philosophers extends App {
  val noOfDiners = 5
  val noOfMeals = 3
  
  var forks = List[String]()
  var diners = List[Actor]()
  
  for (i <- 1 to noOfDiners) {
    diners ::= (new Philosopher(i, noOfMeals).start)
    forks ::= ""
  }
  
  diners.foreach(philosopher => philosopher ! "Eat")
}