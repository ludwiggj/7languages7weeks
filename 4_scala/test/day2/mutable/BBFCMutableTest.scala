package sevenlanguages.scala.daytwo.mutable

import org.junit._

class BBFCMutableTest {
  @Test def shouldCensorOneOfEachLowerCase() {
    val original = "I should shoot that darn cat."
    val sanitised = BBFCMutable.sanitise(original)
    println(original + " => " + sanitised)
    assert(sanitised == "I should pucky that beans cat.")
  }
  
  @Test def shouldCensorOneOfEachUpperCase() {
    val original = "Flip Shootin Tootin!"
    val sanitised = BBFCMutable.sanitise(original)
    println(original + " => " + sanitised)
    assert(sanitised == "Fudge Puckyin Tootin!")
  }
  
  @Test def shouldLeaveSuitableTextUnchanged() {
    val original = "I wondered lonely as a cloud."
    val sanitised = BBFCMutable.sanitise(original)
    println(original + " => " + sanitised)
    assert(sanitised == original)
  }  
}