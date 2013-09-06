package sevenlanguages.scala.daytwo

import org.junit._

class BBFCTest {
  @Test def shouldCensorOneOfEachLowerCase() {
    val original = "I should shoot that darn cat."
    val sanitised = BBFC.sanitise(original)
    println(original + " => " + sanitised)
    assert(sanitised == "I should pucky that beans cat.")
  }
  
  @Test def shouldCensorOneOfEachUpperCase() {
    val original = "Flip Shootin Tootin!"
    val sanitised = BBFC.sanitise(original)
    println(original + " => " + sanitised)
    assert(sanitised == "Fudge Puckyin Tootin!")
  }
  
  @Test def shouldLeaveSuitableTextUnchanged() {
    val original = "I wondered lonely as a cloud."
    val sanitised = BBFC.sanitise(original)
    println(original + " => " + sanitised)
    assert(sanitised == original)
  } 
  
//  @Test def shouldCensorOneOfEachLowerCase() {
//    val original = "I should shoot that darn cat."
//    val sanitised = BBFC.sanitise(original, (Map.empty ++ List(("A","B"))))
//    println(original + " => " + sanitised)
//    assert(sanitised == "I should pucky that beans cat.")
//  }
//  
//  @Test def shouldCensorOneOfEachUpperCase() {
//    val original = "Flip Shootin Tootin!"
//    val sanitised = BBFC.sanitise(original, Map.empty)
//    println(original + " => " + sanitised)
//    assert(sanitised == "Fudge Puckyin Tootin!")
//  }
//  
//  @Test def shouldLeaveSuitableTextUnchanged() {
//    val original = "I wondered lonely as a cloud."
//    val sanitised = BBFC.sanitise(original, Map.empty)
//    println(original + " => " + sanitised)
//    assert(sanitised == original)
//  }
}