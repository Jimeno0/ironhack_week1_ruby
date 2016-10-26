require "Imdb"
require 'colorize'

#Class to search films at the doc
class Seach
  def initialize(route)
    @route = route
    @array = []

    f = File.open(@route, "r")
    f.each_line do |element|
      @array.push(element.chomp)
    end
    f.close
  end

  def get_films_array
    @array
  end
end

#Class to create movies
class Movie
  def initialize(string)
    @title = Imdb::Search.new(string).movies[0].title
    @rating = Imdb::Search.new(string).movies[0].rating.round
  end

  def rating
    @rating
  end

  def title
    @title
  end
end

#Class to print movies
class Printer
  def self.ratings (movies)
    index = 10
    while index>0
      movies.each do |film|
        if film.rating >= index
          print "|#|"
        else
          print "| |"
        end
      end
      print "\n"

      index-=1
    end

    movies.each do |film|
      print"---"
    end
    print "\n"

    for num in 0...movies.length
      print "|#{(num+1).to_s.colorize(:blue)}|"
    end
      print "\n"

    for num in 0...movies.length
      puts "#{(num+1).to_s.colorize(:blue)}. #{movies[num].title}"
    end
  end 
end

#Do the search
search = Seach.new("movies.txt")

#Create the movies array
movies = []
search.get_films_array.each do |element|
 movies.push(Movie.new(element))
end
#Print movies ratings
Printer.ratings(movies)

