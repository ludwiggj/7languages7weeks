package sevenlanguages.scala.daytwo.mutable

import scala.io.Source

object BBFCMutable extends CensorMutable {
  println("Hi I'm the BBFC censor")
  
  Source.fromFile("curseWords.txt").getLines.foreach(translation => addTranslation(translation))
  
  println("Today I will be censoring:" + censoredWords)
  println()
  
  def addTranslation(translation: String) {
    if (translation.startsWith("//")) return
    val aTranslation = translation.split(",")
    censoredWords += aTranslation(0) -> aTranslation(1)
  }
}

//  Source.fromFile("curseWords.txt").getLines.foreach(translation => (censoredWords += translation.split(",")(0) -> translation.split(",")(1)))
//  Source.fromFile("curseWords.txt").getLines.foreach(translation => addTranslation(translation))
//object JamesFerman extends BBFC {}
class Liberal {}
class LessLiberal extends Liberal with CensorMutable