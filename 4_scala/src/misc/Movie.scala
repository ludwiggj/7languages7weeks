object Movie extends Application {
	moviesMatcher()

	def moviesMatcher():Unit = {
		val movies = <movies>
				<movie>The Incredibles</movie>
				<movie>WALL E</movie>
                <short>Jack Jack Attack</short>
                <short>Geri's Game</short>
			</movies>
		(movies \ "_").foreach { movie =>
			movie match {
			  case <movie>{movieName}</movie> => println(movieName)
			  case <short>{shortName}</short> => println(shortName + " (short)")
			}
		}
	}
	
	def movies():Unit = {
		val movies = <movies>
				<movie genre="action">Pirates of the Caribbean</movie>
				<movie genre="fairytale">Edward Scissorhands</movie>
			</movies>
		println(movies.text)
		(movies \ "movie").foreach(movie => println(movie) )
		println((movies \ "movie")(0))
		(movies \ "movie").foreach(movie => println(movie \ "@genre") )
		//((movies \ "@genre") == "action").foreach(genre => println(genre) )
		println((movies \\ "@genre").count(node => true))
		println((movies \\ "@genre").count(node => (node.text.equalsIgnoreCase("action"))))
		println((movies \\ "@genre").filter(node => (node.text.equalsIgnoreCase("action"))).count(node => true))
		println((movies \ "movie").filter(movie => (movie \ "@genre").text.equalsIgnoreCase("action")))
	}
}