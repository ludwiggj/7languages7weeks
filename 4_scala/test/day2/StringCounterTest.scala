package sevenlanguages.scala.daytwo

import org.junit._

class StringCounterTest {
  @Test def shouldCountSevenDwarves() {
    val sevenDwarves = List("Grumpy", "Happy", "Sneezy", "Bashful", "Dopey", "Doc", "Cheeky")
    val count = StringCounter.count(sevenDwarves)
    assert(count == 38)
  }
}