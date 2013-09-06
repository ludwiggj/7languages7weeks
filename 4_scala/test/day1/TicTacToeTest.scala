package sevenlanguages.scala.dayone

import org.junit._

class TicTacToeTest {
  @Test def shouldDetectHorizontalXWin() {
    val x = new TicTacToe(List("X", "X", "X", "O", "O", "_", "_", "_", "_"))
    assert(x.winner() == "X")
  }
  
  @Test def shouldDetectHorizontalOWin() {
    val x = new TicTacToe(List("X", "_", "X", "O", "O", "O", "_", "_", "_"))
    assert(x.winner() == "O")
  }
  
  @Test def shouldDetectVerticalXWin() {
    val x = new TicTacToe(List("X", "O", "X", "X", "O", "O", "X", "_", "_"))
    assert(x.winner() == "X")
  }
  
  @Test def shouldDetectVerticalOWin() {
    val x = new TicTacToe(List("X", "O", "X", "O", "O", "_", "X", "O", "_"))
    assert(x.winner() == "O")
  }
  
  @Test def shouldDetectDiagonalXWin() {
    val x = new TicTacToe(List("X", "O", "O", "_", "X", "O", "_", "_", "X"))
    assert(x.winner() == "X")
  }
  
  @Test def shouldDetectDiagonalOWin() {
    val x = new TicTacToe(List("X", "X", "O", "_", "O", "O", "O", "_", "X"))
    assert(x.winner() == "O")
  }
  
  @Test def shouldDetectDraw() {
    val x = new TicTacToe(List("O", "X", "O", "X", "O", "O", "X", "O", "X"))
    assert(x.winner() == "draw")
  }
  
  @Test def shouldDetectNoWinnerYet() {
    val x = new TicTacToe(List("O", "X", "O", "_", "O", "O", "X", "O", "X"))
    assert(x.winner() == "nobody yet...")
  }
  
}