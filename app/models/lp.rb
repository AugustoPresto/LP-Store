class Lp
  attr_accessor :id, :artist, :title, :year, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @artist = attributes[:artist]
    @title = attributes[:title]
    @year = attributes[:year]
    @price = attributes[:price] || 0
  end
end
