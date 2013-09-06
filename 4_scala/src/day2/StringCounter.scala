package sevenlanguages.scala.daytwo

object StringCounter {
  def count(stringList: List[String]): Int = {
//    return (0 /: stringList) {(sum, i) => sum + i.length()}
    return stringList.foldLeft(0)((sum, i) => sum + i.length())
  }
}