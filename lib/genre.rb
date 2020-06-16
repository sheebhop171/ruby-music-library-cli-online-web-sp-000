require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    #binding.pry
    created_genre = Genre.new(name)
    created_genre.save
    created_genre
  end

  def artists
    @songs.collect {|genre| genre.artist}.uniq
  end
end
