class Movie
  attr_reader :title, :director, :year, :actors, :genre
  attr_accessor :type, :in_stock

  def initialize(title, director, year, actors, genre)
    @title = title
    @director = director
    @year = year
    @actors = actors
    @genre = genre
    @type = type
    @type = year < 2019 ? "F" : "NR"
    @in_stock = true

    #debug
    puts "initializing movie..."
  end

  def print_info
    puts "\n"
    puts "==================================================================================="
    puts "  Title: #{title}"
    puts "  Directed by: #{director}"
    puts "  Year: #{year}"
    puts "  Starring: #{actors.join(", ")}"
    puts "  Genre: #{genre}"
    puts "  Section: #{type}"
    puts "==================================================================================="
    puts "\n"
  end

  def create
    # TODO
    # movie = self.new

  end
end