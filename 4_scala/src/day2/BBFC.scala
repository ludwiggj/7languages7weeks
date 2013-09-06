package sevenlanguages.scala.daytwo

import scala.io.Source

object BBFC extends Censor {
  println("Hello there, I'm the BBFC censor")
  
  val censoredWords = Map.empty ++
  	Source.fromFile("curseWords.txt").getLines.map(translation => {
        val aTranslation = translation.split(",")
        (aTranslation(0), aTranslation(1))
      }
    ).filterNot(tuple => tuple._1.startsWith("//"))
  
  println("Today I will be censoring:" + censoredWords)
  println()
  
  theCensoredWords = censoredWords
}