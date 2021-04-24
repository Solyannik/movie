class Film
  attr_accessor :title, :director, :year

  def initialize(title, director, year)
    @title = title
    @director = director
    @year = year
  end

  def director
    @director
  end

  def to_s
    "#{@director} - #{@title} (#{@year} г.)"
  end
end
