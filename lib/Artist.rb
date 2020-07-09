class Artist 
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(artist)
    artist = Artist.new(name) 
    artist.save
    artist
  end
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self 
    else
      nil 
    end
    
    if songs.include?(song)
      nil
    else
      @songs << song
    end
    @songs
  end
  
  def genres=(genre) 
    artist.genre = genre
    @genres << genre
  end
  
  def genres 
    @genres
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