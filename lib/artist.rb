require 'pry'

class Artist
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
    created_artist = Artist.new(name)
    created_artist.save
    created_artist
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
      #artist.songs << song
    end

    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    #binding.pry
    @songs.collect {|artist| artist.genre}.uniq
  end
end
