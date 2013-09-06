package sevenlanguages.scala.daythree

import scala.io._
import scala.actors._
import Actor._

class Page(url : String) {
  val page = Source.fromURL(url).mkString
  def getSize():Int = {
    return page.length
  }
  def getLinkCount():Int = {
    val link = """<a\s[^>]*href\s*=\s*\"([^\"]*)\"[^>]*>(.*?)</a>""".r
//    link.findAllIn(page).foreach(x => println(x))
    return link.findAllIn(page).count(x => true)
  }
}

object SizerLinkCounter extends App {
  var urls = List("http://www.amazon.com",
      "http://www.twitter.com",
      "http://www.google.com",
      "http://www.cnn.com")
      
  def timeMethod(method: () => Unit) = {
    val start = System.nanoTime
    method()
    val end = System.nanoTime
    println("method took " + (end - start)/1000000000.0 + " seconds.")
  }
  
  def getPageSizeConcurrently() = {
    val caller = self
    for(url <- urls) {
      actor {
        val p = new Page(url)
        caller ! (url, p.getSize, p.getLinkCount)
      }
    }
    
    for(i <- 1 to urls.size) {
      receive {
        case (url, size, linkCount) =>
          println("Url [" + url + "] Size [" + size + "] Link count [" + linkCount + "]")
      }
    }
  }
  timeMethod(getPageSizeConcurrently)
}