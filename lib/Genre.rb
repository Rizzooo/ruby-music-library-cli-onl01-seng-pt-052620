class Genre
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def self.create(genre)
    genre = Genre.new(name)
    genre.save
    genre
  end
  
  def artists=(artist)
    @artist = artist 
  end

  def artists
    @artists
  end
  
  def add_song(song, genre = unknown)
    song = Song.new 
    @songs << song
    song.genre = self
  end
  
  def songs
    @songs
  end
  
  def save
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
end