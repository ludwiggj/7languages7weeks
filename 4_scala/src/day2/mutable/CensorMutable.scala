package sevenlanguages.scala.daytwo.mutable

trait CensorMutable {
  var censoredWords = Map[String,String]()
  def sanitise(sourceText:String):String = {
    var sanitisedText = sourceText
    censoredWords.foreach(wordPair =>
      sanitisedText = sanitisedText.replaceAll(wordPair._1, wordPair._2).replaceAll(wordPair._1.toLowerCase(), wordPair._2.toLowerCase()))
    return sanitisedText
  }
}