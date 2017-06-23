# Please copy/paste all three classes into this file to submit your solution!

require 'pry'

class Rating
  attr_accessor :movie, :viewer
  attr_reader :score

  @@all = []

  def initialize(movie, viewer, score)
    @movie = movie
    @viewer = viewer
    @score = score
    @@all << self
  end

  def self.all
    @@all
  end

end

class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(name)
    @@all.find {|movie| movie.title == name}
  end

  def ratings
    Rating.all.select {|rating| rating.movie == self}
  end

  def viewers
    Rating.all.select {|rating| rating.movie == self}.map{|rating| rating.viewer}
  end

  def average_rating
    self.ratings.map {|rating| rating.score[0].to_i}.inject(:+) / self.ratings.length.to_f
  end

end


class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find {|viewer| viewer.full_name == name}
  end

  def create_rating(movie_title, score)
    new_movie = Movie.find_by_title(movie_title) || Movie.new(movie_title)
    new_rating = Rating.new(new_movie, self, score)
  end

end

johnny = Viewer.new("Johnny", "Bench")
johnnyb = Viewer.new("Johnny", "Bonehead")
johnnyr = Viewer.new("Johnny", "Rubble")
sally = Viewer.new("Sally", "Logging")
jenny = Viewer.new("Jenny", "Tenders")

shining = Movie.new("The Shining")
doolittle = Movie.new("Dr. Doolittle")
american_pie = Movie.new("American Pie")
lion_king = Movie.new("The Lion King")
harry_potter_stone = Movie.new("Harry Potter and the Sorcerer's Stone")
harry_potter_chamber = Movie.new("Harry Potter and the Chamber of Secrets")
batman = Movie.new("Batman")

rating1 = Rating.new(shining, johnny, "5 Stars")
rating2 = Rating.new(batman, johnny, "3 Stars")
rating3 = Rating.new(lion_king, johnny, "4 Stars")

rating4 = Rating.new(american_pie, johnnyb, "5 Stars")

rating5 = Rating.new(doolittle, johnnyr, "2 Stars")
rating6 = Rating.new(lion_king, johnnyr, "4 Stars")
rating7 = Rating.new(shining, johnnyr, "5 Stars")
rating8 = Rating.new(batman, johnnyr, "1 Star")
rating9 = Rating.new(harry_potter_stone, johnnyr, "2 Stars")
rating10 = Rating.new(harry_potter_chamber, johnnyr, "2 Stars")

rating11 = Rating.new(harry_potter_stone, sally, "5 Stars")
rating12 = Rating.new(harry_potter_chamber, sally, "5 Stars")
rating13 = Rating.new(lion_king, sally, "5 Stars")

rating14 = Rating.new(doolittle, jenny, "3 Stars")
rating15 = Rating.new(american_pie, jenny, "1 Stars")
rating16 = Rating.new(lion_king, jenny, "4 Stars")
rating17 = Rating.new(harry_potter_chamber, jenny, "4 Stars")

Pry.start
