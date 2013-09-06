object Regex extends App {
  val reg = """^(F|f)\w*""".r
  println(reg.findFirstIn("Fantastic"))
  println(reg.findFirstIn("not Fantastic"))
  
  val reg1 = "the".r
  println(reg1.findAllIn("the ragged rabbit ran over the other hill with the rolling pin").count(x => true))
}