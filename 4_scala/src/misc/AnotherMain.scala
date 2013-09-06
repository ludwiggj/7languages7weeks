import scala.collection.mutable.HashMap

object Main extends Application {
  println("Look, no main(args: Array[String])")
  
  def double(x: Int):Int = x * 2
  def doubleNoReturn(x: Int) = x * 2
  def doubleFullDef(x: Int):Int = {
    x * 2
  }
  
  def aBunchaStuff() {
    println(double(4))
    println(doubleNoReturn(double(4)))
    println(doubleFullDef(doubleNoReturn(double(4))))
  
    var mutable = "I am mutable"
    mutable = "Touch me, change me"
    var mutableCopy = mutable
  
    val immutable = "I am not mutable"
    // immutable = "Can't touch this"
  
    val x = 1
    // Following statement allowed in console, but not here
    // val x = 2
  
    List(1,2,3)
    List("one", "two", "three")
  
    List("one", 2, "three")
    List("one", 2, "three")(2)
    List("one", 2, "three")(4)
    List("one", 2, "three")(-1)
  
    val animals = Set("lions", "tigers", "bears")
    var animalsII = Set("lions", "tigers", "bears")
  
    animals + "armadillos"
    animalsII + "armadillos"
  
    animals - "tigers"
    animalsII - "tigers"
  
    // Incorrect syntax
    // animals + Set("armadillos")
    // animalsII + Set("armadillos")
  
    animals ++ Set("armadillos")
    animalsII ++ Set("armadillos")
  
    animals -- Set("lions", "penguins")
    animalsII -- Set("lions", "penguins")
  
    animals ** Set("lions", "penguins")
    animals & Set("lions", "penguins")
    animalsII ** Set("lions", "penguins")
    animalsII & Set("lions", "penguins")
  
    List(1,2,3) == List(3,2,1)
    Set(1,2,3) == Set(3,2,1)
  
    val ordinals = Map(0 -> "zero", 1 -> "one", 2 -> "two")
    ordinals(2)
  
    val map = new HashMap[Int, String]
    map += 4 -> "four"
    map += 8 -> "eight"
    // map += "zero" -> 0
  }
  
  def immutableMapValRef() {
    val ordinals = scala.collection.immutable.Map(1 -> "one")
    // reassignment to val - generates new map
    // ordinals += 8 -> "eight"
    println(ordinals)
  }
  
  def immutableMapVarRef() {
    var ordinals = scala.collection.immutable.Map(1 -> "one")
    ordinals += 8 -> "eight"
    println(ordinals)
  }
  
  def mutableMapValRef() {
    val ordinals = scala.collection.mutable.Map(1 -> "one")
    ordinals += 8 -> "eight"
    println(ordinals)
  }
  
  def mutableMapVarRef() {
    var ordinals = scala.collection.mutable.Map(1 -> "one")
    ordinals += 8 -> "eight"
    println(ordinals)
  }

  // UNIT
  def specialPrint(num: Int) = {
    println(">>>" + num + "<<<")
  }
  
  def doThreeTimes(fn: (Int) => Unit) = {
    fn(1); fn(2); fn(3);
  }
  
  def specialPrintII(num: Int, numStr: String) = {
    println(">>>" + num + " is " + numStr + "<<<")
  }
  
  def doThreeTimesII(fn: (Int, String) => Unit) = {
    fn(1, "One"); fn(2, "Two"); fn(3, "Three");
  }
  
  def doUnitStuff() {
    doThreeTimes(println)
    doThreeTimes(specialPrint)
    doThreeTimesII(specialPrintII)
  }
  
  // NULL
  def tryit(thing: Null): Unit = { println("That worked!"); }
  
  def doNullStuff() {
    //  tryit("hey")
    tryit(null)
    val someRef: String = null
    //  tryit(someRef)
    val nullRef: Null = null
    tryit(nullRef)
    val a = "2"
    val b = null
    
    //  val nullRefII: Null = 9
  }

  // NIL and NOTHING
  def doNilNullStuff() {
    Nil
    Nil.length
    Nil ++ "ABC"
    (Nil ++ "ABC").length
    Nil ++ List("ABC")
    (Nil ++ List("ABC")).length
    (Nil ++ List(9,1)).length
    var x = Nil
    //x ++ List[Nothing]("abc")
    //x = x ++ List[Int](2,3,4)
    var y = x ++ List[Int](2,3,4)
    var z = y ++ List[String]("2","3","4")
    val emptyIntList: List[Int] = List[Nothing]()
    val emptyStringList: List[String] = List[Nothing]()
    
    //val emptyStringList: List[String] = List[Nothing]("abc")
    //val emptyStringList: List[Nothing] = List[Nothing]("abc")
  }
  
  def doForEach() {
    val list = List("frodo", "samwise", "pippin")
    list.foreach(it => println(it))
    
    val set = Set("frodo", "samwise", "pippin")
    set.foreach(it => println(it))
    
    val hobbits = Map("frodo" -> "hobbit", "samwise" -> "hobbit", "pippin" -> "hobbit")
    hobbits.foreach(it => println(it))
    hobbits.foreach(it => println(it._1))
    hobbits.foreach(it => println(it._2))
    
    list
    list.isEmpty
    Nil.isEmpty
    
    list.head
    list.tail
    
    list.init
    list.last
    
    list.reverse
    list.drop(1)
    list
    list.drop(2)
    list.drop(3)
    list.drop(4)
    
    val words = List("peg", "al", "bud", "kelly")
    words.count(word => word.size > 2)
    words.filter(word => word.size > 2)

    words.map(word => word.size)
    words.forall(word => word.size > 1)
    words.exists(word => word.size > 4)
    
    words.sort((s,t) => s.charAt(0).toLowerCase < t.charAt(0).toLowerCase)
    words.sortWith((s,t) => s.charAt(0).toLowerCase < t.charAt(0).toLowerCase)
    words.sortWith((s,t) => s.charAt(0).toLower < t.charAt(0).toLower)
    words.sortWith((s,t) => s.size < t.size)
    
    val listOXO = List("X", "X", "X")
    listOXO.foreach(word => println(word == "X"))
    listOXO.count(word => word == "X")
    
    val listFold = List(1,2,3)
    val sum = (0 /: listFold) {(sum,i) => sum + (i*i)}
    val sum2 = listFold.foldLeft(0)((sum,i) => sum + (i*i*i))
  }
}