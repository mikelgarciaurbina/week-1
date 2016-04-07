require "imdb"

class Movie
	attr_accessor :name, :rating
	def initialize(name, rating)
		@name = name
		@rating = rating
	end
end

class MovieContainer
	def initialize
		@movies = []
	end

	def add_movie(movie)
		@movies << movie
	end

	def print_rating
		10.downto(0) do |num|
			@movies.each do |movie|
				print "|"
				if num <= movie.rating.to_i
					print "#"
				else
					print " "
				end
			end
			print "|"
			puts ""
		end
	end	
end



moviecontainer = MovieContainer.new

movies_file = IO.read("movies.txt")
array_movies = movies_file.split("\n")
array_movies.each do |movie|
	search = Imdb::Search.new(movie)
	i = 0 
	rating = nil
	while rating == nil
		rating = search.movies[i].rating
		i += 1
	end
	
	moviecontainer.add_movie(Movie.new(movie, rating))
end

moviecontainer.print_rating

