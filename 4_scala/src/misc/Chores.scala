object Chore extends Application {
  println(doChore("clean dishes"))
  println(doChore("mow lawn"))
  
  def doChore(chore: String): String = chore match {
    case "clean dishes" => "scrub, dry"
    case "cook dinner" => "chop, sizzle"
    case _ => "whine, complain"
  }
}