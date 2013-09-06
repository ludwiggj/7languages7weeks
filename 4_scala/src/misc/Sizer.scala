import scala.io._
import scala.actors._
import Actor._

object PageLoader {
  def getPageSize(url : String) = Source.fromURL(url).mkString.length
}

object Sizer extends App {
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
  
  def timeMethod(method: (String) => Int, url:String): Int = {
    val start = System.nanoTime
    val returnVal = method(url)
    val end = System.nanoTime
    print((end - start)/1000000000.0 + " seconds => ")
    return returnVal
  }
  
  def getPageSizeSequentially() = {
    for(url <- urls) {
      println("Size for url " + url + ": " + timeMethod(PageLoader.getPageSize, url))
    }
  }
  
  def getPageSizeConcurrently() = {
    val caller = self
    for(url <- urls) {
      actor { caller ! (url, timeMethod(PageLoader.getPageSize, url))}
      //actor { caller ! url}
    }
    
    for(i <- 1 to urls.size) {
      receive {
        case (url, size) =>
          println("Size for url " + url + ": " + size)
        case (url) =>
          println("Size for url " + url + ": " + timeMethod(PageLoader.getPageSize, url.toString()))
      }
    }
  }
  
  println("Sequential")
  timeMethod(getPageSizeSequentially)
  println("Concurrent")
  timeMethod(getPageSizeConcurrently)
}