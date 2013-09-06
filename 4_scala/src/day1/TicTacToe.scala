package sevenlanguages.scala.dayone

class TicTacToe(val board:List[String]) {
  assert(board.length == 9)
  /*
   * 0 | 1 | 2
   * 3 | 4 | 5
   * 6 | 7 | 8
   */
  
  val winningLines = List(List(0, 1, 2), List(3, 4, 5), List(6, 7, 8),
                          List(0, 3, 6), List(1, 4, 7), List(2, 5, 8),
                          List(0, 4, 8), List(6, 4, 2)
                         )
                             
  def displayLine(line: List[Int]) {
    print("|")
    line.foreach(elem => print(board(elem) + " "))
  }
  
  def winningLine(player: String, line: List[Int]):Boolean = {
    return line.map(pos => board(pos)).count(counter => counter == player) == 3
  }
  
  def hasWon(player: String): Boolean = {
    winningLines.exists(line => winningLine(player, line))
  }
  
  def displayWinningLines() {
    winningLines.foreach(line => displayLine(line))
  }
  
  def winner():String = {
    displayBoard()
    displayWinningLines()
    if (hasWon("X")) {
      println(">>>> X wins")
      return "X"
    }
    if (hasWon("O")) {
      println(">>>> O wins")
      return "O"
    }
    if (board.exists(counter => counter == "_")) {
      println(">>>> nobody yet...")
      return "nobody yet..."
    }
    println(">>>> draw")
    return "draw"
  }
  
  def displayBoard() {
    println
    displayLine(List(0, 1, 2))
    println
    displayLine(List(3, 4, 5))
    println
    displayLine(List(6, 7, 8))
    println
    println
  }
}