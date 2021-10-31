class MovieCollection
  attr_reader :movies

  def initialize(movies)
    @movies = movies
    @directors = []
  end

  def directors_for_output
    @directors = movies.map(&:director).uniq
  end

  def select_by_choice(user_choice)
    movies.select { |x| x.director == @directors[user_choice - 1] }
  end
end
