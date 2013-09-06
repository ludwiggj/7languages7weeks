import scala.actors._
import scala.actors.Actor._

//case object Poke
//case object Feed

class Kid() extends Actor {
  def act() {
    loop {
      react {
        case "poke" => {
          println("Ow!")
          println("Quit it!")
        }
        case "feed" => {
          println("Gurgle")
          println("Burp")
        }
      }
    }
  }
}

object SchoolClass extends Application {
  val bart = new Kid().start
  val lisa = new Kid().start

  println("Contenders ready!")
  bart ! "poke1"
  lisa ! "poke1"
  bart ! "feed1"
  lisa ! "feed1"
}