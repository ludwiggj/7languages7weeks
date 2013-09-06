package sevenlanguages.scala.daytwo

trait Censor {
  var theCensoredWords: Map[String, String] = _

  def sanitise(sourceText:String):String = {
    return (theCensoredWords.foldLeft(sourceText)((text, wordPair) =>
      text.replaceAll(wordPair._1, wordPair._2).replaceAll(wordPair._1.toLowerCase(), wordPair._2.toLowerCase())))
  }
  
//  def sanitise(sourceText:String, theCensoredWords:Map[String,String]):String = {
//    return (theCensoredWords.foldLeft(sourceText)((text, wordPair) =>
//      text.replaceAll(wordPair._1, wordPair._2).replaceAll(wordPair._1.toLowerCase(), wordPair._2.toLowerCase())))
//  }
}