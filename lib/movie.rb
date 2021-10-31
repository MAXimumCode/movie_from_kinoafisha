class Movie
  attr_reader :title, :director, :date

  def initialize(title, director, date)
    @title = title
    @director = director
    @date = date.to_i
  end

  def to_s
    "#{@director} - #{@title} (#{@date})"
  end
end
